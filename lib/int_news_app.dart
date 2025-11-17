import 'package:flutter/material.dart';
import 'package:int_news/core/routing/app_router.dart';
import 'package:int_news/core/routing/routes.dart';
import 'package:int_news/core/theming/app_theme.dart';

class IntNewsApp extends StatelessWidget {
  const IntNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: 'INTnews App',
      initialRoute: Routes.homeScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
