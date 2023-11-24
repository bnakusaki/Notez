import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/features/authentication/data/model/authentication_button_model.dart';
import 'package:notez/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:notez/shared/assets/image_assets.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    List<AuthenticationButtonModel> authenticationButtonModels = [
      AuthenticationButtonModel(
        label: l10n.continueWithFederatedProviderButtonLable('Google'),
        logoPath: ImageAssets.googleLogo,
      ),
      AuthenticationButtonModel(
        label: l10n.continueWithFederatedProviderButtonLable('Apple'),
        logoPath: ImageAssets.appleLogo,
      ),
    ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.signInPageTitle,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 5),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, authenticationState) {
              switch (authenticationState) {
                case Authenticating():
                  return const CircularProgressIndicator();
                case FailedToAuthenticate():
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            title: Text(l10n.alertDialogErrorTitle),
                            content: Text(authenticationState.message),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(l10n.cancelButtonLabel),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                case Unauthenticated() || FailedToAuthenticate():
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      authenticationButtonModels.length,
                      (index) {
                        final button = authenticationButtonModels[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: OutlinedButton(
                            onPressed: () async {
                              context.read<AuthenticationBloc>().add(AuthenticateWithGoogleEvent());
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: 10.0),
                                Image.network(
                                  button.logoPath,
                                  height: 30,
                                ),
                                const Spacer(),
                                Text(
                                  button.label,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                case Authenticated():
                  return Text(l10n.welcomeBackMessage);
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
