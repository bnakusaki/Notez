import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/authentication/authentication_dependency_injection.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:notez/features/header/presentation/bloc/header_event.dart';
import 'package:notez/features/header/presentation/bloc/header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(NoUserHeaderState('Notez')) {
    User? currentUser = sl<AuthenticationBloc>().getCurrentUser().fold(
          (failure) => null,
          (user) => user,
        );

    on<SetHeaderTitle>((event, emit) {
      switch (currentUser) {
        case null:
          emit(NoUserHeaderState(event.title));
        case User():
          emit(
            UserAvailableHeaderState(
              event.title,
              userName: currentUser.displayName,
              photoUrl: currentUser.photoUrl,
            ),
          );
      }
    });
  }
}
