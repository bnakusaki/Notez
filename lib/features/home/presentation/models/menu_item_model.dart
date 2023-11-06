import 'package:notez/features/home/domain/entities/menu.dart';

class MenuItemModel {
  MenuItemModel({
    required this.label,
    required this.screen,
    required this.menu,
  });

  final String label;
  final String screen;
  final Menu menu;
}
