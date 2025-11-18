import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:int_news/features/home/data/models/news_model.dart';
import 'package:int_news/features/home/data/repo/home_repo.dart';
import 'package:int_news/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeState(states: HomeStates.initial));

  /// Fetch top headlines
  Future<void> fetchTopHeadlines({int page = 1, int pageSize = 6}) async {
    emit(state.copyWith(states: HomeStates.loading));

    final result = await homeRepo.fetchTopHeadlines(
      page: page,
      limit: pageSize,
    );

    result.fold(
      (error) {
        emit(state.copyWith(states: HomeStates.error, apiErrorModel: error));
      },
      (newsResponse) {
        emit(
          state.copyWith(
            states: HomeStates.loaded,
            topHeadlines: newsResponse,
            apiErrorModel: null,
          ),
        );
      },
    );
  }

  int everythingPage = 1;
  final int pageSize = 10;

  /// Fetch everything endpoint with pagination
  Future<void> fetchEverything({
    String query = 'general',
    bool loadMore = false,
  }) async {
    if (!loadMore) {
      everythingPage = 1;
      emit(state.copyWith(states: HomeStates.loading, everythingNews: null));
    }

    final result = await homeRepo.fetchEverything(
      query: query,
      page: everythingPage,
      pageSize: pageSize,
    );

    result.fold(
      (error) {
        emit(state.copyWith(states: HomeStates.error, apiErrorModel: error));
      },
      (newsResponse) {
        List<Article> updatedArticles = [];

        if (loadMore && state.everythingNews != null) {
          updatedArticles = [
            ...state.everythingNews!.articles,
            ...newsResponse.articles,
          ];
        } else {
          updatedArticles = newsResponse.articles;
        }

        emit(
          state.copyWith(
            states: HomeStates.loaded,
            everythingNews: NewsResponse(
              status: newsResponse.status,
              totalResults: newsResponse.totalResults,
              articles: updatedArticles,
            ),
            apiErrorModel: null,
          ),
        );

        everythingPage++;
      },
    );
  }
}
