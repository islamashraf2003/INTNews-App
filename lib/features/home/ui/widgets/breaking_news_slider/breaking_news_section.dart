import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:int_news/core/helper/snackbar.dart';
import 'package:int_news/features/home/logic/cubit/home_cubit.dart';
import 'package:int_news/features/home/logic/cubit/home_state.dart';
import 'package:int_news/features/home/ui/widgets/breaking_news_slider/breaking_news_slider.dart';
import 'package:int_news/features/home/ui/widgets/breaking_news_slider/breaking_news_slider_loading.dart';

class BreakingNewsSection extends StatelessWidget {
  const BreakingNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isError) {
          showSnackBar(context, 'There was an error');
        }
      },
      builder: (context, state) {
        if (state.isLoaded && state.topHeadlines != null) {
          return BreakingNewsSlider(newsResponse: state.topHeadlines!);
        } else {
          return const BreakingNewsSliderLoading();
        }
      },
    );
  }
}
