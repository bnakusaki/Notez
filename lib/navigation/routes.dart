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
    GoRoute(
      path: '/home',
      name: RouteNames.home,
      builder: (context, state) => const HomePage(),
    )
  ],
);
