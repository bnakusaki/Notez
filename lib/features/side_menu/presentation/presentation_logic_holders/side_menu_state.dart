import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/side_menu/entities/menu.dart';

class SideMenuStateCubit extends Cubit<Menu> {
  SideMenuStateCubit() : super(Menu.home);

  void setMenu(Menu menu) => emit(menu);
}
