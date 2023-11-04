// ignore_for_file: missing_provider_scope
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:notez/features/note/note_dependency_injection.dart' as note_dependency_injection;
import 'package:notez/features/onboarding/presentation/pages/onbording_page.dart';
// import 'package:notez/shared/database.dart';
import 'package:notez/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // note_dependency_injection.init();
  // await NotezDatabase.database();

  runApp(const Notez());
}

class Notez extends StatelessWidget {
  const Notez({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Notez',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      home: const OnboardingPage(),
    );
  }
}
