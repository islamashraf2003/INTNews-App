import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:int_news/core/theming/styles.dart';
import 'package:int_news/features/home/logic/cubit/home_cubit.dart';
import 'package:int_news/features/home/logic/cubit/home_state.dart';
import 'package:int_news/features/home/ui/screens/article_detail_screen.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  String _selectedCategory = 'general';
  bool _isLoadingMore = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchEverything(query: _selectedCategory);

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _hasMore) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    _isLoadingMore = true;
    await context.read<HomeCubit>().fetchEverything(query: _selectedCategory, loadMore: true);

    final state = context.read<HomeCubit>().state;
    final currentCount = state.everythingNews?.articles.length ?? 0;
    final total = state.everythingNews?.totalResults ?? 0;
    if (currentCount >= total) {
      _hasMore = false;
    }
    _isLoadingMore = false;
    setState(() {});
  }

  Future<void> _onCategorySelected(String category) async {
    if (_selectedCategory == category) return;

    setState(() {
      _selectedCategory = category;
      _hasMore = true;
    });

    _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);

    await context.read<HomeCubit>().fetchEverything(query: _selectedCategory, loadMore: false);
  }

  Future<void> _onRefresh() async {
    await context.read<HomeCubit>().fetchEverything(query: _selectedCategory, loadMore: false);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cat = _categories[index];
          final bool selected = cat == _selectedCategory;

          return ChoiceChip(
            label: Text(
              cat[0].toUpperCase() + cat.substring(1),
              style: selected ? TextStylesManager.font14WhiteBold : TextStylesManager.font14GreykRegular,
            ),
            selected: selected,
            onSelected: (_) => _onCategorySelected(cat),
            selectedColor: ColorsManager.primaryColor,
            backgroundColor: Colors.white,
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All News"), backgroundColor: ColorsManager.primaryColor),
      body: Column(
        children: [
          _buildCategoryChips(),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.isLoading && state.everythingNews == null) {
                  return const Center(child: CircularProgressIndicator(color: ColorsManager.primaryColor));
                }

                final articles = state.everythingNews?.articles ?? [];

                final totalResults = state.everythingNews?.totalResults ?? 0;
                if (articles.length >= totalResults) {
                  _hasMore = false;
                } else {
                  _hasMore = true;
                }

                return RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    itemCount: articles.length + (_hasMore ? 1 : 0),
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      if (index == articles.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: CircularProgressIndicator(color: ColorsManager.primaryColor),
                          ),
                        );
                      }

                      final article = articles[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ArticleDetailScreen(
                                title: article.title,
                                subtitle: article.description ?? "",
                                image: article.urlToImage ?? "",
                                author: article.author ?? "N/A",
                                publishedAt: article.publishedAt,
                                url: article.url,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: ColorsManager.black.withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                  image: article.urlToImage != null
                                      ? DecorationImage(image: NetworkImage(article.urlToImage!), fit: BoxFit.cover)
                                      : null,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              horizontalSpacing(16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpacing(10),
                                    Text(
                                      article.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStylesManager.font16BlackBold,
                                    ),
                                    verticalSpacing(6),
                                    Text(
                                      article.description ?? "",
                                      style: TextStylesManager.font14GreykRegular,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    verticalSpacing(10),
                                  ],
                                ),
                              ),
                              horizontalSpacing(12),
                              Icon(Icons.arrow_forward_ios, size: 16, color: ColorsManager.grey),
                              horizontalSpacing(12),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
