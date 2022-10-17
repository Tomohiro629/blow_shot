import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/app/sign_in_page/sign_in_page.dart';
import 'package:blow_shot/app/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipePage extends StatelessWidget {
  const LiquidSwipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: const [SignUpPage(), SignInPage()],
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
