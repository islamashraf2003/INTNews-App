import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:int_news/core/theming/styles.dart';
import 'package:int_news/features/home/data/models/news_model.dart';
import 'package:int_news/features/home/ui/screens/article_detail_screen.dart';
import 'package:int_news/features/home/ui/widgets/all_news_list/recommendations_see_all.dart';

class AllNewsList extends StatelessWidget {
  const AllNewsList({super.key, required this.newsResponse});
  final NewsResponse newsResponse;

  @override
  Widget build(BuildContext context) {
    final articles = newsResponse.articles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RecommendationsSeeAll(),
        verticalSpacing(16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: articles.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
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
        ),
      ],
    );
  }
}
