import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/features/authentication/authentication_dependency_injection.dart';
import 'package:notez/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/bloc/authentication_state.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => sl<AuthenticationBloc>(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.appName,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 5.0),
            Text(
              l10n.productPurpose1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              l10n.productPurpose2,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
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
                  case Unauthenticated():
                    return FilledButton(
                      onPressed: () async {
                        context.read<AuthenticationBloc>().add(AuthenticateAnonymouslyEvent());
                      },
                      child: Text(l10n.getStartedButtonLabel),
                    );
                  case Authenticated():
                    return Text(l10n.welcomeBackMessage);
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 20),
          ].animate(interval: .100.seconds).fade(),
        ),
      ),
    );
  }
}
