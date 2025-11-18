import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:int_news/core/theming/styles.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy static data
    final List<Map<String, String>> articles = List.generate(
      8,
      (index) => {
        "title": "Breaking News Title $index",
        "description": "This is a short description for news article $index.",
        "image": "https://via.placeholder.com/150",
        "author": "Author $index",
        "publishedAt": "2025-11-18",
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("All News"),
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.separated(
          itemCount: articles.length,
          separatorBuilder: (context, index) => verticalSpacing(16),
          itemBuilder: (context, index) {
            final article = articles[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              shadowColor: Colors.black12,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(article["image"]!),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey.shade300,
                    ),
                  ),
                  horizontalSpacing(12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article["title"]!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStylesManager.font16BlackBold,
                          ),
                          verticalSpacing(6),
                          Text(
                            article["description"]!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStylesManager.font14GreykRegular,
                          ),
                          verticalSpacing(6),
                          Text(
                            article["publishedAt"]!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  horizontalSpacing(12),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                  horizontalSpacing(12),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
