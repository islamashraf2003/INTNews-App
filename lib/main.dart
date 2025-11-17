import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:int_news/core/di/dependency_injection.dart';
import 'package:int_news/int_news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const IntNewsApp());
}
