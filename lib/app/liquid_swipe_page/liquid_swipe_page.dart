import 'package:blow_shot/app/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipePage extends StatelessWidget {
  const LiquidSwipePage({super.key, required this.pages});
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        slideIconWidget: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.primary,
        ),
        positionSlideIcon: 0.5,
        enableSideReveal: true,
      ),
    );
  }
}
