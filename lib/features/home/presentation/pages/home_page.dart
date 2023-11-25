import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/header/presentation/bloc/header_bloc.dart';
import 'package:notez/features/header/presentation/header.dart';
import 'package:notez/features/note/note_dependency_injection.dart';
import 'package:notez/features/note/presentation/bloc/note_bloc.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_bloc.dart';
import 'package:notez/features/side_menu/presentation/side_menu.dart';
import 'package:notez/shared/navigation/route_names.dart';

class HomePage extends StatelessWidget {
  const HomePage(
    this.child, {
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        return context.goNamed(RouteNames.onboarding);
      }
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider<HeaderBloc>(create: (_) => HeaderBloc()),
        BlocProvider<NoteBloc>(create: (_) => sl<NoteBloc>()),
        BlocProvider<SideMenuBloc>(create: (_) => SideMenuBloc()),
      ],
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    const SizedBox(height: 20),
                    Expanded(child: child),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
