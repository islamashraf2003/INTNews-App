import 'package:dio/dio.dart';
import 'package:int_news/core/networking/api_constants.dart';
import 'package:int_news/features/home/data/models/news_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

//flutter pub run build_runner build
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  // -------------------- NEWS API --------------------

  // Fetch Top Headlines
  @GET(ApiConstants.topHeadlines)
  Future<NewsResponse> fetchTopHeadlines({
    @Query("language") String language = "en",
    @Query("page") int page = 1,
    @Query("pageSize") int pageSize = 5,
    @Query("apiKey") String apiKey = ApiConstants.apiKey,
  });
}
