import 'package:hive_flutter/hive_flutter.dart';
import 'package:int_news/features/home/data/models/news_model.dart';

class HiveManager {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SourceAdapter());
    Hive.registerAdapter(ArticleAdapter());
    Hive.registerAdapter(NewsResponseAdapter());
  }

  static Box get newsBox => Hive.box('newsBox');
}
