import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:notez/shared/assets/image_assets.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      height: MediaQuery.sizeOf(context).height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage(
            ImageAssets.onboardingScreenBackground,
          ),
          // fit: BoxFit.cover,
        ),
      ),
    ).animate(delay: .300.seconds).fade();
  }
}
