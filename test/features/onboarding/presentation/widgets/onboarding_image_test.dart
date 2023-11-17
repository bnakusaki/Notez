import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notez/features/onboarding/presentation/widgets/onboarding_image.dart';
import 'package:notez/shared/assets/image_assets.dart';

void main() {
  testWidgets('Onboarding image is displayed', (tester) async {
    // Arrange.
    await tester.pumpWidget(const OnboardingImage());

    // Act.
    final imageFinder =
        find.widgetWithImage(Container, const AssetImage(ImageAssets.onboardingScreenBackground));

    // Assert.
    expect(imageFinder, findsOneWidget);
  });
}
