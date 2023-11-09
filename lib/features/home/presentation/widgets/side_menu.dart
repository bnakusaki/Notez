import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/home/domain/entities/menu.dart';
import 'package:notez/features/home/presentation/models/menu_item_model.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/drawer_state.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/home_state.dart';
import 'package:notez/features/note/note_dependency_injection.dart';

// TODO: Implement advanced menu feature.
class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    List<MenuItemModel> menuItems = [
      MenuItemModel(label: 'Notes', screen: '', menu: Menu.allNotes),
    ];

    return BlocBuilder<DrawerStateCubit, DrawerState>(
      builder: (context, drawerState) {
        switch (drawerState) {
          case Open():
            return Expanded(
              child: Drawer(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 70.0),
                      ...List.generate(menuItems.length, (index) {
                        final menuItem = menuItems[index];
                        return TextButton(
                          onPressed: () {
                            context.read<MenuStateCubit>().setMenu(menuItem.label);
                            context.goNamed(menuItem.screen);
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                          ),
                          child: Text(
                            menuItem.label,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                          ),
                        );
                      }),
                      const Divider(),
                      const Spacer(),
                      OutlinedButton.icon(
                        onPressed: () async {
                          final bloc = sl<AuthenticationBloc>();
                          await bloc.signOut();
                        },
                        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red)),
                        icon: const Icon(
                          Ionicons.log_out_outline,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Log out',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
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
