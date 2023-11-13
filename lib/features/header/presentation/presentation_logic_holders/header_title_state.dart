import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderTitleStateCubit extends Cubit<String> {
  HeaderTitleStateCubit() : super('Notez');

  setHeaderTitle(String value) {
    emit(value);
  }
}
