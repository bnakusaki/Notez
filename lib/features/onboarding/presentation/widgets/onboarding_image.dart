import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:notez/shared/assets/image_assets.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.onboardingScreenBacground,
      // fit: BoxFit.cover,
      height: MediaQuery.sizeOf(context).height * 0.7,
    ).animate(delay: .300.seconds).slideX(
          begin: 1,
          curve: Curves.easeIn,
          duration: 1.5.seconds,
        );
  }
}
