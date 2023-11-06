import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';
import 'package:notez/navigation/routes.dart';
import 'package:notez/theme.dart';

class Notez extends StatelessWidget {
  const Notez({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticateUserCubit>(
          create: (BuildContext context) => AuthenticateUserCubit(),
        ),
        BlocProvider<AuthenticateAnonymouslyCubit>(
          create: (BuildContext context) => AuthenticateAnonymouslyCubit(),
        ),
      ],
      child: BlocBuilder<AuthenticateUserCubit, AuthenticationState>(
        builder: (context, authenticationState) {
          return MaterialApp.router(
            theme: theme,
            title: 'Notez',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            routerConfig: routes,
          );
        },
      ),
    );
  }
}
