import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/features/authentication/data/model/authentication_button_model.dart';
import 'package:notez/features/authentication/domain/entities/federated_provider.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';
import 'package:notez/shared/assets/image_assets.dart';
import 'package:notez/shared/widgets/error_dialog.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    List<AuthenticationButtonModel> authenticationButtons = [
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

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.signInPageTitle,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: colorScheme.scrim),
          ),
          const SizedBox(height: 30),
          BlocBuilder<AuthenticateUserCubit, AuthenticationState>(
            builder: (context, authenticationState) {
              switch (authenticationState.status) {
                case AuthenticationStatus.processing:
                  return const CircularProgressIndicator();
                case AuthenticationStatus.failedToAuthenticate:
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return ErrorDialog(errorMessage: authenticationState.message!);
                        },
                      );
                    },
                  );
                case AuthenticationStatus.unauthenticated:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      authenticationButtons.length,
                      (index) {
                        final button = authenticationButtons[index];
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
                case AuthenticationStatus.authenticated:
                  return const Text('Welcome back');
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
