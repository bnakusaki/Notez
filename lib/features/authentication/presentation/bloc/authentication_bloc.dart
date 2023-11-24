import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_anonymously.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_apple.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_google.dart';
import 'package:notez/features/authentication/domain/use_cases/get_current_user.dart';
import 'package:notez/features/authentication/domain/use_cases/log_out.dart';
import 'package:notez/features/authentication/presentation/bloc/authentication_state.dart';

part 'authentication_event.dart';

/// AuthenticationBloc manages the authentication state of the application.
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
    this.authenticateWithGoogle,
    this.authenticateWithApple,
    this.authenticateAnonymously,
    this.logOut,
    this.getCurrentUser,
  ) : super(Unauthenticated()) {
    on<AuthenticateWithGoogleEvent>((event, emit) async {
      emit(Authenticating());
      final response = await authenticateWithGoogle();
      response.fold(
        (e) {
          emit(FailedToAuthenticate(e.message, e.details));
        },
        (user) {
          emit(Authenticated(user));
        },
      );
    });
    on<AuthenticateWithAppleEvent>((event, emit) async {
      emit(Authenticating());
      final response = await authenticateWithApple();
      response.fold(
        (e) {
          emit(FailedToAuthenticate(e.message, e.details));
        },
        (user) {
          emit(Authenticated(user));
        },
      );
    });
    on<AuthenticateAnonymouslyEvent>((event, emit) async {
      emit(Authenticating());
      final response = await authenticateAnonymously();
      response.fold(
        (e) {
          emit(FailedToAuthenticate(e.message, e.details));
        },
        (user) {
          emit(Authenticated(user));
        },
      );
    });
    // Event listener for the LogOutEvent
    on<LogOutEvent>((event, emit) async {
      emit(Authenticating());
      final response = await logOut();
      response.fold(
        (e) {
          emit(FailedToAuthenticate(e.message, e.details));
        },
        (r) {
          emit(Unauthenticated());
        },
      );
    });

    // Event listener for the GetCurrentUserEvent
    on<GetCurrentUserEvent>((event, emit) async {
      emit(Authenticating());
      final response = getCurrentUser();
      response.fold(
        (e) {
          emit(FailedToAuthenticate(e.message, e.details));
        },
        (user) {
          if (user == null) {
            emit(Unauthenticated());
          } else {
            emit(Authenticated(user));
          }
        },
      );
    });
  }

  // Dependencies required for performing authentication actions
  final AuthenticateWithGoogle authenticateWithGoogle;
  final AuthenticateWithApple authenticateWithApple;
  final AuthenticateAnonymously authenticateAnonymously;
  final LogOut logOut;
  final GetCurrentUser getCurrentUser;
}
