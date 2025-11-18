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
  bool _isLoadingMore = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchEverything(query: 'general');

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoadingMore &&
          _hasMore) {
        _loadMore();
      }
    });
  }

  void _loadMore() async {
    _isLoadingMore = true;

    await context.read<HomeCubit>().fetchEverything(
      query: 'general',
      loadMore: true,
    );

    final state = context.read<HomeCubit>().state;
    if (state.everythingNews != null &&
        state.everythingNews!.articles.length >=
            state.everythingNews!.totalResults) {
      _hasMore = false;
    }

    _isLoadingMore = false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All News"),
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading && state.everythingNews == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
              ),
            );
          }

          final articles = state.everythingNews?.articles ?? [];

          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: articles.length + (_hasMore ? 1 : 0),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index == articles.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    ),
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
                              ? DecorationImage(
                                  image: NetworkImage(article.urlToImage!),
                                  fit: BoxFit.cover,
                                )
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
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: ColorsManager.grey,
                      ),
                      horizontalSpacing(12),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
