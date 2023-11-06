import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/home/presentation/presentation_logic_holder/drawer_state.dart';

class HomeState {}

class DrawerStateCubit extends Cubit<DrawerState> {
  DrawerStateCubit() : super(Open());

  void opentDrawer() => emit(Open());
  void closeDrawer() => emit(Close());
  void toggleDrawer() {
    if (state is Open) {
      emit(Close());
    } else if (state is Close) {
      emit(Open());
    }
  }
}

class MenuStateCubit extends Cubit<String> {
  MenuStateCubit() : super('All notes');

  void setMenu(String menuLabel) {
    if (menuLabel != state) {
      emit(menuLabel);
    }
  }
}
