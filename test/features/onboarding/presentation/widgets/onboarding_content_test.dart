import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notez/features/onboarding/presentation/widgets/onboarding_content.dart';

import '../test_app.dart';

void main() {
  testWidgets('Product purpose widget displays correctly', (tester) async {
    // Arrange.
    await tester.pumpWidget(const TestApp(child: OnboardingContent()));

    String productName = 'Notez';
    String msg1 = 'A Latex solution by ODUM';
    String msg2 = 'Change your notes into Latex documents.';
    String getStartedButtonLabel = 'Get started';

    // Act.
    final productNameFinder = find.text(productName);
    final msg1Finder = find.text(msg1);
    final msg2Finder = find.text(msg2);
    final getStartedButtonFinder = find.widgetWithText(FilledButton, getStartedButtonLabel);

    // Assert.
    expect(productNameFinder, findsOneWidget);
    expect(msg1Finder, findsOneWidget);
    expect(msg2Finder, findsOneWidget);
    expect(getStartedButtonFinder, findsOneWidget);
  });
}
