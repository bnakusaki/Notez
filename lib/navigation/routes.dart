import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:notez/features/home/presentation/pages/home_page.dart';
import 'package:notez/features/onboarding/presentation/pages/onbording_page.dart';
import 'package:notez/navigation/route_names.dart';

GoRouter routes = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      name: RouteNames.onboarding,
      builder: (context, state) => const OnboardingPage(),
      routes: [
        GoRoute(
          path: 'signIn',
          name: RouteNames.signIn,
          builder: (context, state) => const SignInPage(),
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) => HomePage(child),
      routes: [
        GoRoute(
          path: '/allNotes',
          name: RouteNames.home,
          builder: (context, state) => Container(color: Colors.red),
        ),
      ],
    )
  ],
);
