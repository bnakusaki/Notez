import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PurposeIllustrarionByImage extends StatelessWidget {
  const PurposeIllustrarionByImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        'assets/images/notes.jpeg',
      ).animate(delay: .900.seconds).fade(),
    );
  }
}
