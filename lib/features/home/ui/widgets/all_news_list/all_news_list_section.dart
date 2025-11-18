import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:int_news/core/helper/snackbar.dart';
import 'package:int_news/features/home/logic/cubit/home_cubit.dart';
import 'package:int_news/features/home/logic/cubit/home_state.dart';
import 'package:int_news/features/home/ui/widgets/all_news_list/all_news_list.dart';
import 'package:int_news/features/home/ui/widgets/all_news_list/all_news_list_loading.dart';

class AllNewsListSection extends StatelessWidget {
  const AllNewsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isError) {
          showSnackBar(context, 'There was an error');
        }
      },
      builder: (context, state) {
        if (state.isLoaded && state.everythingNews != null) {
          return AllNewsList(newsResponse: state.everythingNews!);
        } else {
          return AllNewsListLoading();
        }
      },
    );
  }
}
