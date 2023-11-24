import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_events.dart';
import 'package:notez/features/side_menu/presentation/bloc/side_menu_state.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  SideMenuBloc() : super(HomeMenuState()) {
    on<HomeMenuEvent>((event, emit) => emit(HomeMenuState()));
    on<NoteMenuEvent>((event, emit) => emit(NoteMenuState()));
  }
}
