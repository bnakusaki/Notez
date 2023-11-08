import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/home_state.dart';
import 'package:notez/features/home/presentation/widgets/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage(
    this.child, {
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.scrim,
      appBar: AppBar(
        backgroundColor: colorScheme.scrim,
        leading: IconButton(
          onPressed: () {
            context.read<DrawerStateCubit>().toggleDrawer();
          },
          icon: const Icon(Ionicons.menu),
          splashRadius: 20.0,
        ),
        title: BlocBuilder<MenuStateCubit, String>(
          builder: (context, menuState) {
            return Text(AppLocalizations.of(context)!.currentPath(menuState));
          },
        ),
        centerTitle: false,
      ),
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            flex: 7,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: child,
            ),
          ).animate(delay: .200.seconds).scaleX(curve: Curves.easeIn),
        ],
      ),
    );
  }
}
