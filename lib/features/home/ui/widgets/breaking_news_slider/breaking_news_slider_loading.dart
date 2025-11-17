import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BreakingNewsSliderLoading extends StatefulWidget {
  const BreakingNewsSliderLoading({super.key});

  @override
  State<BreakingNewsSliderLoading> createState() =>
      _BreakingNewsSliderLoadingState();
}

class _BreakingNewsSliderLoadingState extends State<BreakingNewsSliderLoading> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final int itemCount = 5;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: itemCount,
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
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              period: const Duration(milliseconds: 1200),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: ColorsManager.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        ColorsManager.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        verticalSpacing(12),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: itemCount,
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
