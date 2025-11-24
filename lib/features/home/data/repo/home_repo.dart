import 'package:dartz/dartz.dart';
import 'package:int_news/core/cache/hive_keys.dart';
import 'package:int_news/core/cache/hive_manager.dart';
import 'package:int_news/core/networking/api_error_handler.dart';
import 'package:int_news/core/networking/api_error_model.dart';
import 'package:int_news/core/networking/api_service.dart';
import 'package:int_news/features/home/data/models/news_model.dart';

class HomeRepo {
  final ApiService apiService;
  HomeRepo(this.apiService);
  Future<Either<ApiErrorModel, NewsResponse>> fetchTopHeadlines({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiService.fetchTopHeadlines(
        page: page,
        pageSize: limit,
      );
      final newsCache = HiveManager.newsBox;
      newsCache.put(HiveKeys.topHeadlines, response);
      return Right(response);
    } catch (error) {
      final newsCache = HiveManager.newsBox;
      final cachedData = newsCache.get(HiveKeys.topHeadlines);
      if (cachedData != null) {
        return Right(cachedData);
      }
      return Left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, NewsResponse>> fetchEverything({
    required String query,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final response = await apiService.fetchEverything(
        query: query,
        page: page,
        pageSize: pageSize,
      );
      final newsCache = HiveManager.newsBox;
      newsCache.put(HiveKeys.everything, response);
      return Right(response);
    } catch (error) {
      final newsCache = HiveManager.newsBox;
      final cachedData = newsCache.get(HiveKeys.everything);
      if (cachedData != null) {
        return Right(cachedData);
      }
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
