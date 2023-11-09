// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IconButtonWithLabel extends StatelessWidget {
  const IconButtonWithLabel({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final Function() onTap;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 100.0,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
