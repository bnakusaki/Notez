import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/authentication/authentication_dependency_injection.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:notez/features/header/presentation/bloc/header_event.dart';

class HeaderBloc extends Bloc<HeaderEvent, (String, User?)> {
  HeaderBloc()
      : super((
          'Notez',
          sl<AuthenticationBloc>().getCurrentUser().fold(
                (failure) => null,
                (user) => user,
              )
        )) {
    User? currentUser = sl<AuthenticationBloc>().getCurrentUser().fold(
          (failure) => null,
          (user) => user,
        );

    on<SetHeaderTitle>((event, emit) {
      emit((event.title, currentUser));
    });
  }
}
