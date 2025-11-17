import 'package:flutter/material.dart';
import 'package:int_news/core/routing/app_router.dart';
import 'package:int_news/core/routing/routes.dart';

class IntNewsApp extends StatelessWidget {
  const IntNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INTnews App',
      initialRoute: Routes.homeScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
