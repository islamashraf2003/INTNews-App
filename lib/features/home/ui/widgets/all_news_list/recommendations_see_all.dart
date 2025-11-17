import 'package:flutter/material.dart';
import 'package:int_news/core/theming/font_weight.dart';
import 'package:int_news/core/theming/styles.dart';

class RecommendationsSeeAll extends StatelessWidget {
  const RecommendationsSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recommendations",
            style: TextStylesManager.font18PrimayColorSemiBold,
          ),
          Text(
            "See All",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeightManager.medium,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
