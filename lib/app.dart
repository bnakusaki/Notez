import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/home_state.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/all_notes_page_state.dart';
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
        BlocProvider<DrawerStateCubit>(
          create: (BuildContext context) => DrawerStateCubit(),
        ),
        BlocProvider<MenuStateCubit>(
          create: (BuildContext context) => MenuStateCubit(),
        ),
        BlocProvider<AllNotesPageStateCubit>(
          create: (BuildContext context) => AllNotesPageStateCubit(),
        ),
        BlocProvider<CurrentNoteCubit>(
          create: (BuildContext context) => CurrentNoteCubit(),
        ),
      ],
      child: BlocBuilder<AuthenticateUserCubit, AuthenticationState>(
        builder: (context, authenticationState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
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
