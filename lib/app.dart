import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/shared/navigation/routes.dart';
import 'package:notez/theme.dart';

class Notez extends StatelessWidget {
  const Notez({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Notez',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      routerConfig: routes,
    );
  }
}
