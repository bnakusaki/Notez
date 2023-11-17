import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:notez/shared/assets/image_assets.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset(
        ImageAssets.onboardingScreenBackground,
        height: MediaQuery.sizeOf(context).height * 0.5,
      ),
    ).animate(delay: .300.seconds).fade();
  }
}
