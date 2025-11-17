import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:int_news/core/networking/api_service.dart';
import 'package:int_news/int_news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  final apiService = ApiService(dio);

  final news = await apiService.fetchTopHeadlines(
    language: "en",
    page: 1,
    pageSize: 5,
  );

  print("Total articles: ${news.totalResults}");
  print("First article: ${news.articles[0].title}");
  runApp(const IntNewsApp());
}
