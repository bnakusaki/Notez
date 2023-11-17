import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/authentication/presentation/widgets/sign_in_form.dart';
import 'package:notez/features/authentication/presentation/widgets/sign_in_message.dart';
import 'package:notez/navigation/route_names.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        return context.goNamed(RouteNames.home);
      }
    });

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 830) {
            return const Center(child: SignInForm());
          }
          return const Row(
            children: [
              Expanded(
                flex: 7,
                child: SignInMessage(),
              ),
              Expanded(
                flex: 10,
                child: Center(
                  child: SignInForm(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
