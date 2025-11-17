import 'package:flutter/material.dart';
import 'package:int_news/features/home/ui/widgets/app_bar/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(children: [HomeAppBar()])),
    );
  }
}
