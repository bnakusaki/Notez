import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(
    this.child, {
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notes',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          Expanded(child: child)
        ],
      ),
    );
    // Scaffold(
    //   backgroundColor: colorScheme.scrim,
    //   appBar: AppBar(
    //     backgroundColor: colorScheme.scrim,
    //     leading: IconButton(
    //       onPressed: () {
    //         context.read<DrawerStateCubit>().toggleDrawer();
    //       },
    //       icon: const Icon(Ionicons.menu),
    //       splashRadius: 20.0,
    //     ),
    //     title: BlocBuilder<MenuStateCubit, String>(
    //       builder: (context, menuState) {
    //         return Text(AppLocalizations.of(context)!.currentPath(menuState));
    //       },
    //     ),
    //     centerTitle: false,
    //   ),
    //   body: Row(
    //     children: [
    //       const SideMenu(),
    //       Expanded(
    //         flex: 7,
    //         child: Container(
    //           margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 70.0),
    //           padding: const EdgeInsets.all(10.0),
    //           decoration: BoxDecoration(
    //             color: Theme.of(context).colorScheme.background,
    //             borderRadius: BorderRadius.circular(15.0),
    //           ),
    //           child: child,
    //         ),
    //       ).animate(delay: .200.seconds).scaleX(curve: Curves.easeIn),
    //     ],
    //   ),
    // );
  }
}
