import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';
import 'package:int_news/features/home/logic/cubit/home_cubit.dart';
import 'package:int_news/features/home/ui/widgets/all_news_list/all_news_list_section.dart';
import 'package:int_news/features/home/ui/widgets/app_bar/home_app_bar.dart';
import 'package:int_news/features/home/ui/widgets/breaking_news_slider/breaking_news_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ColorsManager.primaryColor,
        onRefresh: () async {
          final cubit = context.read<HomeCubit>();
          await cubit.fetchTopHeadlines(page: 1, pageSize: 6);
          await cubit.fetchEverything(loadMore: false);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              HomeAppBar(),
              verticalSpacing(20),
              BreakingNewsSection(),
              verticalSpacing(20),
              AllNewsListSection(),
              verticalSpacing(30),
            ],
          ),
        ),
      ),
    );
  }
}
