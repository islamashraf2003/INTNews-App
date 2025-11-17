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
  final NewsResponse? response;
  final ApiErrorModel? apiErrorModel;

  HomeState({required this.states, this.response, this.apiErrorModel});

  HomeState copyWith({
    HomeStates? states,
    NewsResponse? response,
    ApiErrorModel? apiErrorModel,
  }) {
    return HomeState(
      states: states ?? this.states,
      response: response ?? this.response,
      apiErrorModel: apiErrorModel ?? this.apiErrorModel,
    );
  }

  @override
  String toString() =>
      'HomeState(states: $states, response: $response, apiErrorModel: $apiErrorModel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.states == states &&
        other.response == response &&
        other.apiErrorModel == apiErrorModel;
  }

  @override
  int get hashCode =>
      states.hashCode ^ response.hashCode ^ apiErrorModel.hashCode;
}
