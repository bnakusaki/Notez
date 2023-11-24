import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/authentication/authentication_dependency_injection.dart';
import 'package:notez/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/widgets/sign_in_form.dart';
import 'package:notez/features/authentication/presentation/widgets/sign_in_message.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<AuthenticationBloc>(),
        child: const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SignInMessage(),
                ),
                Expanded(
                  flex: 10,
                  child: SignInForm(),
                ),
              ],
            ),
          ),
        ));
  }
}
