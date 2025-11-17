import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:int_news/features/home/data/models/news_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BreakingNewsSlider extends StatefulWidget {
  const BreakingNewsSlider({super.key, required this.newsResponse});
  final NewsResponse newsResponse;

  @override
  State<BreakingNewsSlider> createState() => _BreakingNewsSliderState();
}

class _BreakingNewsSliderState extends State<BreakingNewsSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final articles = widget.newsResponse.articles;

    if (articles.isEmpty) {
      return const SizedBox(
        height: 220,
        child: Center(child: Text("No breaking news")),
      );
    }

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: articles.length,
          options: CarouselOptions(
            height: 220,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final article = articles[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: article.urlToImage != null
                    ? DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: Colors.grey.shade300, // fallback color
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.bottomLeft,
                child: Text(
                  article.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        verticalSpacing(12),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: articles.length,
          effect: ExpandingDotsEffect(
            activeDotColor: ColorsManager.primaryColor,
            dotColor: Colors.grey.shade300,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
            spacing: 6,
          ),
        ),
      ],
    );
  }
}
