class MenuItemModel {
  MenuItemModel({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final Function() onPressed;
}
