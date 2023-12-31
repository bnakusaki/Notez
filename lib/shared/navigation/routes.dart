import 'package:go_router/go_router.dart';
import 'package:notez/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:notez/features/home/presentation/pages/home_page.dart';
import 'package:notez/features/note/presentation/pages/all_notes_page.dart';
import 'package:notez/features/note/presentation/pages/read_note_page.dart';
import 'package:notez/features/onboarding/presentation/pages/onbording_page.dart';
import 'package:notez/shared/navigation/route_names.dart';

GoRouter routes = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      name: RouteNames.onboarding,
      builder: (context, state) => const OnboardingPage(),
      routes: [
        GoRoute(
          path: 'logIn',
          name: RouteNames.logIn,
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
            builder: (context, state) => const AllNotesPage()),
        GoRoute(
          path: '/readNote/:noteId',
          builder: (context, state) {
            return ReadNotePage(
              noteId: state.pathParameters['noteId']!,
            );
          },
        ),
      ],
    )
  ],
);
