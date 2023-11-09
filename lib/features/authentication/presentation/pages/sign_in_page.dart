import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/authentication/domain/entities/federated_provider.dart';
import 'package:notez/features/authentication/presentation/models/authentication_button_model.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';
import 'package:notez/navigation/route_names.dart';
import 'package:notez/shared/assets/image_assets.dart';

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
        label: l10n.continueWithGoogleButtonLable,
        logoPath: ImageAssets.googleLogo,
      ),
      AuthenticationButtonModel(
        federatedProvider: FederatedProvider.apple,
        label: l10n.continueWithAppleButtonLable,
        logoPath: ImageAssets.appleLogo,
      ),
    ];

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(ImageAssets.signInScreenBacground),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                l10n.signInPageMessage,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ).animate().fade(),
            ),
          ),
          Expanded(
            flex: 10,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.signInPageTitle,
                    style:
                        Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<AuthenticateUserCubit, AuthenticationState>(
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
                                  await context
                                      .read<AuthenticateUserCubit>()
                                      .call(button.federatedProvider);
                                },
                                icon: Image.asset(
                                  button.logoPath,
                                  height: 30,
                                ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
