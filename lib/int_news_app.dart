import 'package:flutter/material.dart';
import 'package:int_news/home/screens/home_screen.dart' show HomeScreen;

class IntNewsApp extends StatelessWidget {
  const IntNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'INTnews App', home: HomeScreen());
  }
}
