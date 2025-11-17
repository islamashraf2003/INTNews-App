import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:int_news/core/theming/font_weight.dart';
import 'package:int_news/features/home/ui/widgets/all_news_list/recommendations_see_all.dart';

class AllNewsList extends StatelessWidget {
  const AllNewsList({super.key});

  final List<Map<String, String>> allNews = const [
    {
      "title": "INTCORE announces Q4 results",
      "subtitle": "The company reports a record growth in Q4 2025",
      "image": "assets/images/news.png",
    },
    {
      "title": "New mobile app released",
      "subtitle": "INTNEWS app now available for employees worldwide",
      "image": "assets/images/news.png",
    },
    {
      "title": "Office reopening post pandemic",
      "subtitle": "All employees are requested to follow new guidelines",
      "image": "assets/images/news.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecommendationsSeeAll(),
        verticalSpacing(16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: allNews.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final news = allNews[index];
            return InkWell(
              onTap: () {},
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
                        image: DecorationImage(
                          image: AssetImage(news['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    horizontalSpacing(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news['title']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.bold,
                              color: ColorsManager.black,
                            ),
                          ),
                          verticalSpacing(6),
                          Text(
                            news['subtitle']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeightManager.regular,
                              color: ColorsManager.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
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
