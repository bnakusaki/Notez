import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/features/onboarding/presentation/widgets/product_purpose.dart';
import 'package:notez/features/onboarding/presentation/widgets/purpose_illustration_by_image.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        backgroundColor: colorScheme.scrim,
        appBar: AppBar(
          title: Text(l10n.appName),
          centerTitle: false,
          elevation: 0.0,
          actions: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 20.0)),
              child: Text(l10n.signInButtonLabel),
            ),
          ],
          backgroundColor: colorScheme.scrim,
        ),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: SingleChildScrollView(
                child: constraints.maxWidth < 763
                    ? const Column(
                        children: [
                          PurposeIllustrarionByImage(),
                          SizedBox(height: 20.0),
                          ProductPurpose(),
                        ],
                      )
                    : const Row(
                        children: [
                          Expanded(child: ProductPurpose()),
                          Expanded(child: PurposeIllustrarionByImage()),
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
                child: Text(l10n.privacyAndTermsButtonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
