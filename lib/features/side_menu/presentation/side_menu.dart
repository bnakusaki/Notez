import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/side_menu/entities/menu.dart';
import 'package:notez/features/side_menu/presentation/presentation_logic_holders/side_menu_state.dart';
import 'package:notez/features/side_menu/presentation/widgets/home_menu.dart';
import 'package:notez/features/side_menu/presentation/widgets/note_menu.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideMenuStateCubit, Menu>(
      builder: (context, sideMenuState) {
        debugPrint(sideMenuState.toString());
        switch (sideMenuState) {
          case Menu.home:
            return const HomeMenu();
          case Menu.note:
            return const NoteMenu();
          default:
            return const SizedBox.shrink();
        }
      },
      // buildWhen: (previous, current) {
      //   debugPrint((previous != current).toString());
      //   return previous != current;
      // },
    );
  }
}
