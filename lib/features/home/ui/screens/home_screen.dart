import 'package:flutter/material.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/features/home/ui/widgets/all_news_list/all_news_list.dart';
import 'package:int_news/features/home/ui/widgets/app_bar/home_app_bar.dart';
import 'package:int_news/features/home/ui/widgets/breaking_news_slider/breaking_news_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            verticalSpacing(20),
            BreakingNewsSection(),
            verticalSpacing(20),
            AllNewsList(),
            verticalSpacing(30),
          ],
        ),
      ),
    );
  }
}
