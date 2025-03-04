import 'package:bookly/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../home/presentation/views/home_view.dart';
import 'animated_text.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    initSlideAnimation();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(
      Duration(seconds: 3),
      () => Get.to(transition: Transition.fadeIn, () => HomeView()),
    );
  }

  void initSlideAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 6),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Image.asset(AppAssets.logo),
        SizedBox(height: 5),

        AnimatedText(controller: _controller, slideAnimation: slideAnimation),
      ],
    );
  }
}
