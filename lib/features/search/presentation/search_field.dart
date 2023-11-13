import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// TODO: Implement search feature.
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Ionicons.search),
      ),
    );
  }
}
