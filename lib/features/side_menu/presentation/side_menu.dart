import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_bloc.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_state.dart';
import 'package:notez/features/side_menu/presentation/widgets/home_menu.dart';
import 'package:notez/features/side_menu/presentation/widgets/note_menu.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideMenuBloc, SideMenuState>(
      builder: (context, sideMenuState) {
        debugPrint(sideMenuState.toString());
        switch (sideMenuState) {
          case HomeMenuState():
            return const HomeMenu();
          case NoteMenuState():
            return const NoteMenu();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
