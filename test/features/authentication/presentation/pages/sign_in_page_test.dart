import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notez/features/authentication/presentation/pages/sign_in_page.dart';

import '../../../onboarding/presentation/test_app.dart';

void main() {
  FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 59577);
  testWidgets('Shows the sign in page correctly', (tester) async {
    // Arrange.
    await tester.pumpWidget(const TestApp(child: SignInPage()));

    String signInPageTitle = 'Sign into your account';
    String googleButtonLabel = 'Continue with Google';
    String appleButtonLabel = 'Continue with Apple';
    String msg1 = 'Unlock your projects on all devices with a simple sign-in to Notez';

    // Act.
    final titleFinder = find.text(signInPageTitle);
    final googleButtonFinder = find.widgetWithText(OutlinedButton, googleButtonLabel);
    final appleButtonFinder = find.widgetWithText(OutlinedButton, appleButtonLabel);
    final msg1Finder = find.widgetWithText(Container, msg1);

    // Assert.
    expect(titleFinder, findsOneWidget);
    expect(googleButtonFinder, findsOneWidget);
    expect(appleButtonFinder, findsOneWidget);
    expect(msg1Finder, findsOneWidget);
  });
}
