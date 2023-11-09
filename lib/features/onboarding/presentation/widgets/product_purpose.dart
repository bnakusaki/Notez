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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.appName,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Text(
                l10n.productPurpose1,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
            ),
            Text(
              l10n.productPurpose2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 20.0),
            BlocBuilder<AuthenticateAnonymouslyCubit, AuthenticationState>(
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
              return FilledButton(
                onPressed: () async => await context.read<AuthenticateAnonymouslyCubit>().call(),
                child: Text(l10n.getStartedButtonLabel),
              );
            })
          ].animate(interval: .300.seconds).fade().slide(),
        ),
      ),
    );
  }
}
