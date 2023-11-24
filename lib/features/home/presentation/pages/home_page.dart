import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/header/presentation/header.dart';
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
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  // const SizedBox(height: 20),
                  // Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
