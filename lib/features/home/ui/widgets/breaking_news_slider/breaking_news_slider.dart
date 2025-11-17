import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BreakingNewsSlider extends StatefulWidget {
  const BreakingNewsSlider({super.key});

  @override
  State<BreakingNewsSlider> createState() => _BreakingNewsSliderState();
}

class _BreakingNewsSliderState extends State<BreakingNewsSlider> {
  final List<Map<String, String>> breakingNews = const [
    {
      "title": "INTCORE launches new AI product",
      "image": "assets/images/news.png",
    },
    {
      "title": "Company reaches 1M users milestone",
      "image": "assets/images/news.png",
    },
    {
      "title": "New partnership with Tech Giant",
      "image": "assets/images/news.png",
    },
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: breakingNews.length,
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
            final news = breakingNews[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(news['image']!),
                  fit: BoxFit.cover,
                ),
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
                  news['title']!,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
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
          count: breakingNews.length,
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
