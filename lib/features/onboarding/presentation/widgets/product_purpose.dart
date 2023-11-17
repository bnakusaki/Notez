import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';
import 'package:notez/shared/widgets/error_dialog.dart';

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
          const SizedBox(height: 5.0),
          Text(
            l10n.productPurpose1,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10.0),
          Text(
            l10n.productPurpose2,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          BlocBuilder<AuthenticateAnonymouslyCubit, AuthenticationState>(
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
                            return ErrorDialog(errorMessage: authenticationState.message!);
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
          const SizedBox(height: 20),
        ].animate(interval: .100.seconds).fade(),
      ),
    );
  }
}
