import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductPurpose extends StatelessWidget {
  const ProductPurpose({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final white = Theme.of(context).colorScheme.onBackground;
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
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Text(
                l10n.productPurpose1,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Text(
              l10n.productPurpose2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: white,
                  ),
            ),
            const SizedBox(height: 20.0),
            FilledButton(
              onPressed: () {},
              child: Text(l10n.getStartedButtonLabel),
            )
          ].animate(interval: .300.seconds).fade().slide(),
        ),
      ),
    );
  }
}
