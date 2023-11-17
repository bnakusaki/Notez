import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notez/features/onboarding/presentation/pages/onbording_page.dart';

import '../test_app.dart';

void main() {
  FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 59577);
  testWidgets('Onboarding page presents correctly', (tester) async {
    // Arrange.
    await tester.pumpWidget(const TestApp(child: OnboardingPage()));

    // Act.
    final companyNameFinder = find.text('ODUM');
    final privacyAndTermsButtonFinder = find.widgetWithText(TextButton, 'Privacy & Terms');
    final signInButtonFinder = find.widgetWithText(TextButton, 'Sign in');

    // Assert.
    expect(companyNameFinder, findsOneWidget);
    expect(privacyAndTermsButtonFinder, findsOneWidget);
    expect(signInButtonFinder, findsOneWidget);
  });
}
