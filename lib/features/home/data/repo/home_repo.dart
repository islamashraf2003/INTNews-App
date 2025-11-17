import 'package:dartz/dartz.dart';
import 'package:int_news/core/networking/api_error_handler.dart';
import 'package:int_news/core/networking/api_error_model.dart';
import 'package:int_news/core/networking/api_service.dart';
import 'package:int_news/features/home/data/models/news_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);
  Future<Either<ApiErrorModel, NewsResponse>> fetchChapters({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiService.fetchTopHeadlines();
      return Right(response);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
