import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;

  const SearchBarWidget({super.key, this.hintText = "Search news..."});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: ColorsManager.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: ColorsManager.white, size: 26),
              horizontalSpacing(10),
              Expanded(
                child: TextField(
                  style: const TextStyle(color: ColorsManager.white),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: ColorsManager.white.withOpacity(0.7),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
