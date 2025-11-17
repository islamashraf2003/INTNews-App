import 'package:flutter/material.dart';
import 'package:int_news/core/helper/extensions.dart';
import 'package:int_news/core/helper/spacing.dart';
import 'package:int_news/core/theming/colors.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF34C54), Color(0xFFE63A42)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.white.withOpacity(0.15),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.black.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.construction,
                  size: 64,
                  color: ColorsManager.white,
                ),
              ),
            ),
            verticalSpacing(32),
            Text(
              "Feature Coming Soon",
              style: TextStyle(
                color: ColorsManager.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpacing(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "We're working hard to bring you this amazing feature. Stay tuned!",
                style: TextStyle(
                  color: ColorsManager.white.withOpacity(0.85),
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpacing(40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.white,
                foregroundColor: ColorsManager.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 6,
              ),
              onPressed: () {
                context.pop();
              },
              child: const Text(
                "Back to Home",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
