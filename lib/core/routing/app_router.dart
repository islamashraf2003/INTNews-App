import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:int_news/core/di/dependency_injection.dart';
import 'package:int_news/core/routing/routes.dart';
import 'package:int_news/core/widgets/coming_soon.dart';
import 'package:int_news/features/home/logic/cubit/home_cubit.dart';
import 'package:int_news/features/home/ui/screens/home_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>()..fetchTopHeadlines(),
            child: const HomeScreen(),
          ),
        );

      case Routes.comingSoon:
        return _createPageTransition(
          child: const ComingSoon(),
          transitionType: PageTransitionType.fade,
        );

      default:
        return _createPageTransition(child: const HomeScreen());
    }
  }

  static PageRoute _createPageTransition({
    required Widget child,
    PageTransitionType transitionType = PageTransitionType.slide,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (context) => child);
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;

        if (transitionType == PageTransitionType.slide) {
          final slideTween = Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: curve));
          final slideAnimation = animation.drive(slideTween);
          return SlideTransition(position: slideAnimation, child: child);
        }

        if (transitionType == PageTransitionType.fade) {
          return FadeTransition(opacity: animation, child: child);
        }

        if (transitionType == PageTransitionType.scale) {
          return ScaleTransition(scale: animation, child: child);
        }

        return child;
      },
    );
  }
}

enum PageTransitionType { slide, fade, scale }
