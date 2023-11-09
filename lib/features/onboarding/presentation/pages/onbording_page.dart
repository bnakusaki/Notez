import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/onboarding/presentation/widgets/onboarding_image.dart';
import 'package:notez/features/onboarding/presentation/widgets/product_purpose.dart';
import 'package:notez/navigation/route_names.dart';

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
      builder: (context, constraints) => Scaffold(
        appBar: AppBar(
          title: Text(l10n.appName),
          centerTitle: false,
          elevation: 0.0,
          actions: [
            TextButton(
              onPressed: () => context.goNamed(RouteNames.signIn),
              style: TextButton.styleFrom(
                fixedSize: const Size(150, 50),
              ),
              child: Text(l10n.signInButtonLabel),
            ),
          ],
        ),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: SingleChildScrollView(
                child: constraints.maxWidth < 763
                    ? const Column(
                        children: [
                          OnboardingImage(),
                          SizedBox(height: 20.0),
                          ProductPurpose(),
                        ],
                      )
                    : const Row(
                        children: [
                          Expanded(child: ProductPurpose()),
                          Expanded(child: OnboardingImage()),
                        ],
                      ),
              ),
            )),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 70.0,
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
      ),
    );
  }
}
