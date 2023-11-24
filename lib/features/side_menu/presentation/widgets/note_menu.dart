import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:notez/features/home/data/models/menu_item_model.dart';

class NoteMenu extends StatelessWidget {
  const NoteMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<MenuItemModel> menuItems = [
      MenuItemModel(
        label: 'Delete',
        onPressed: () {},
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70.0),
          ...List.generate(
            menuItems.length,
            (index) {
              final menuItem = menuItems[index];
              return TextButton(
                onPressed: menuItem.onPressed,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                ),
                child: Text(
                  menuItem.label,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                ),
              );
            },
          ),
          const Divider(),
          const Spacer(),
        ],
      ),
    ).animate().slideX(duration: .200.seconds, curve: Curves.easeIn);
  }
}
