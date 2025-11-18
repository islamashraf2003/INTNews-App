import 'package:flutter_bloc/flutter_bloc.dart';
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

  /// Fetch everything endpoint
  Future<void> fetchEverything({
    required String query,
    int page = 1,
    int pageSize = 8,
  }) async {
    emit(state.copyWith(states: HomeStates.loading));

    final result = await homeRepo.fetchEverything(
      query: query,
      page: page,
      pageSize: pageSize,
    );

    result.fold(
      (error) {
        emit(state.copyWith(states: HomeStates.error, apiErrorModel: error));
      },
      (newsResponse) {
        emit(
          state.copyWith(
            states: HomeStates.loaded,
            everythingNews: newsResponse,
            apiErrorModel: null,
          ),
        );
      },
    );
  }
}
