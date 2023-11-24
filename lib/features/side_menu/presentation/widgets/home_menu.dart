import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:notez/features/header/presentation/bloc/header_bloc.dart';
import 'package:notez/features/header/presentation/bloc/header_event.dart';
import 'package:notez/features/home/data/models/menu_item_model.dart';
import 'package:notez/shared/navigation/route_names.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    List<MenuItemModel> menuItems = [
      MenuItemModel(
        label: l10n.allNotesSideMenuTabLabel,
        onPressed: () {
          context.read<HeaderBloc>().add(SetHeaderTitle('Notes'));
          context.goNamed(RouteNames.home);
        },
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70.0),
          ...List.generate(menuItems.length, (index) {
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
          }),
          const Divider(),
          const Spacer(),
        ],
      ),
    ).animate().slideX(duration: .200.seconds, curve: Curves.easeIn);
  }
}
