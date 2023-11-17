import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.errorMessage,
    this.errorDetails,
  }) : super(key: key);

  final String errorMessage;
  final String? errorDetails;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog.adaptive(
      title: Text(l10n.alertDialogErrorTitle),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancelButtonLabel),
        ),
      ],
    );
  }
}
