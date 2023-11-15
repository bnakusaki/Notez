import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';

class ProductPurpose extends StatelessWidget {
  const ProductPurpose({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.appName,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: Text(
              l10n.productPurpose1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Text(
            l10n.productPurpose2,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: BlocBuilder<AuthenticateAnonymouslyCubit, AuthenticationState>(
              builder: (context, authenticationState) {
                switch (authenticationState.status) {
                  case AuthenticationStatus.processing:
                    return const CircularProgressIndicator();
                  case AuthenticationStatus.unauthenticated:
                    if (authenticationState.message != null) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog.adaptive(
                                title: Text(l10n.alertDialogErrorTitle),
                                content: Text(
                                  authenticationState.message!,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    }
                  default:
                }
                return FilledButton(
                  onPressed: () async => await context.read<AuthenticateAnonymouslyCubit>().call(),
                  child: Text(l10n.getStartedButtonLabel),
                );
              },
            ),
          ),
        ].animate(interval: .100.seconds).fade(),
      ),
    );
  }
}
