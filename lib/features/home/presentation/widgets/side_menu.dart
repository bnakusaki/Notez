import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/home/domain/entities/menu.dart';
import 'package:notez/features/home/presentation/models/menu_item_model.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/drawer_state.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/home_state.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<MenuItemModel> menuItems = [
      MenuItemModel(label: 'All notes', screen: '', menu: Menu.allNotes),
    ];
    return BlocBuilder<DrawerStateCubit, DrawerState>(
      builder: (context, drawerState) {
        switch (drawerState) {
          case Open():
            return Expanded(
              child: Drawer(
                backgroundColor: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10.0),
                    ...List.generate(menuItems.length, (index) {
                      final menuItem = menuItems[index];
                      return TextButton(
                        onPressed: () {
                          context.read<MenuStateCubit>().setMenu(menuItem.label);
                          context.goNamed(menuItem.screen);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20.0),
                        ),
                        child: InkWell(
                          child: Text(
                            menuItem.label,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ).animate().slideX(duration: .200.seconds, curve: Curves.easeIn),
            );
          case Close():
            return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
