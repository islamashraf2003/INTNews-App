import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/styles.dart';
import 'package:int_news/core/widgets/custom_search_bar_widget.dart';
import 'package:int_news/features/home/ui/widgets/app_bar/Custom_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF34C54), Color(0xFFE63A42)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomIcon(icon: Icons.business),
                    horizontalSpacing(12),
                    Text("INTnews", style: TextStylesManager.font20BlueBold),
                  ],
                ),
                CustomIcon(icon: Icons.notifications_none_rounded),
              ],
            ),
            verticalSpacing(25),
            Text("Good morning👋", style: TextStylesManager.font22BlueBold),
            verticalSpacing(20),
            SearchBarWidget(),
          ],
        ),
      ),
    );
  }
}
