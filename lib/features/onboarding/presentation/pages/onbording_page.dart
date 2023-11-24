import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:notez/features/onboarding/presentation/widgets/onboarding_image.dart';
import 'package:notez/shared/navigation/route_names.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        return context.goNamed(RouteNames.home);
      }
    });

    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.appName),
            actions: [
              TextButton(
                onPressed: () => context.goNamed(RouteNames.logIn),
                child: Text(l10n.logInButtonLabel),
              ),
            ],
          ),
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: SingleChildScrollView(
                child: constraints.maxWidth < 700
                    ? const OnboardingContent()
                    : const Row(
                        children: [
                          Expanded(
                            child: OnboardingContent(),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: OnboardingImage(),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                Text(
                  l10n.companyName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(width: 15.0),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    fixedSize: const Size(150, 50),
                  ),
                  child: Text(l10n.privacyAndTermsButtonLabel),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
