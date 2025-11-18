import 'package:int_news/core/networking/api_error_model.dart';
import 'package:int_news/features/home/data/models/news_model.dart';

enum HomeStates { initial, loading, loaded, error }

extension HomeStateX on HomeState {
  bool get isInitial => states == HomeStates.initial;
  bool get isLoading => states == HomeStates.loading;
  bool get isLoaded => states == HomeStates.loaded;
  bool get isError => states == HomeStates.error;
}

class HomeState {
  final HomeStates states;
  final NewsResponse? topHeadlines;
  final NewsResponse? everythingNews;
  final ApiErrorModel? apiErrorModel;

  HomeState({
    required this.states,
    this.topHeadlines,
    this.everythingNews,
    this.apiErrorModel,
  });

  HomeState copyWith({
    HomeStates? states,
    NewsResponse? topHeadlines,
    NewsResponse? everythingNews,
    ApiErrorModel? apiErrorModel,
  }) {
    return HomeState(
      states: states ?? this.states,
      topHeadlines: topHeadlines ?? this.topHeadlines,
      everythingNews: everythingNews ?? this.everythingNews,
      apiErrorModel: apiErrorModel ?? this.apiErrorModel,
    );
  }

  @override
  String toString() {
    return 'HomeState(states: $states, topHeadlines: $topHeadlines, everythingNews: $everythingNews, apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.states == states &&
        other.topHeadlines == topHeadlines &&
        other.everythingNews == everythingNews &&
        other.apiErrorModel == apiErrorModel;
  }

  @override
  int get hashCode {
    return states.hashCode ^
        topHeadlines.hashCode ^
        everythingNews.hashCode ^
        apiErrorModel.hashCode;
  }
}
