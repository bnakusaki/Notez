import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notez/shared/assets/image_assets.dart';

class SignInMessage extends StatelessWidget {
  const SignInMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(30.0),
      height: MediaQuery.sizeOf(context).height - 40,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(ImageAssets.signInScreenBacground),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        l10n.signInPageMessage,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimary,
            ),
      ).animate().fade(),
    );
  }
}
