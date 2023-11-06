import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/authentication/domain/entities/federated_provider.dart';
import 'package:notez/features/authentication/presentation/models/authentication_button_model.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';
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

    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    List<AuthenticationButtonModel> authenticationButtonModels = [
      AuthenticationButtonModel(
        federatedProvider: FederatedProvider.google,
        label: l10n.google,
        icon: Ionicons.logo_google,
      ),
      AuthenticationButtonModel(
        federatedProvider: FederatedProvider.apple,
        label: l10n.apple,
        icon: Ionicons.logo_apple,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.appName),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: colorScheme.scrim,
      ),
      backgroundColor: colorScheme.scrim,
      body: Center(
        child: BlocBuilder<AuthenticateUserCubit, AuthenticationState>(
          builder: (context, authenticationState) {
            switch (authenticationState) {
              case Loading():
                return const CircularProgressIndicator();
              case Failure():
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            title: Text(l10n.alertDialogErrorTitle),
                            content: Text(authenticationState.message),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(l10n.cancelButtonLabel),
                              )
                            ],
                          );
                        });
                  },
                );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                authenticationButtonModels.length,
                (index) {
                  final button = authenticationButtonModels[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await context.read<AuthenticateUserCubit>().call(button.federatedProvider);
                      },
                      icon: Icon(button.icon),
                      label: Text(
                        button.label,
                        style: TextStyle(color: colorScheme.onBackground),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
