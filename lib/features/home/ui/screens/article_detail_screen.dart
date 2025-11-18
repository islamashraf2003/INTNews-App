import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String author;
  final String publishedAt;
  final String url;

  const ArticleDetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.author,
    required this.publishedAt,
    required this.url,
  });

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'article_image_$title',
            child: SizedBox(
              height: 330,
              width: double.infinity,
              child: image.isNotEmpty
                  ? FadeInImage(
                      placeholder: AssetImage('assets/images/placeholder.webp'),
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/placeholder.webp',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Container(
            height: 330,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 16,
            child: CircleAvatar(
              backgroundColor: ColorsManager.primaryColor,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: ColorsManager.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.58,
            minChildSize: 0.58,
            maxChildSize: 0.95,
            builder: (_, controller) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black12,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 18),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                      ),
                      verticalSpacing(14),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            flex: 2,
                            child: Text(
                              author,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          horizontalSpacing(12),
                          const Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            flex: 1,
                            child: Text(
                              publishedAt,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      verticalSpacing(22),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.55,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      verticalSpacing(30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _launchUrl,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.primaryColor,
                            foregroundColor: ColorsManager.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.article, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Read Full Article',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacing(20),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
