import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/authentication/domain/entities/federated_provider.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_anonymously.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_apple.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_google.dart';
import 'package:notez/features/authentication/domain/use_cases/sign_out.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';
import 'package:notez/features/note/note_dependency_injection.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

class AuthenticationBloc {
  AuthenticationBloc(
    this._authenticateWithGoogle,
    this._authenticateWithApple,
    this._authenticateAnonymously,
    this._signOut,
  );

  final AuthenticateWithGoogle _authenticateWithGoogle;
  final AuthenticateWithApple _authenticateWithApple;
  final AuthenticateAnonymously _authenticateAnonymously;
  final SignOut _signOut;

  Future<Either<AuthException, User>> authenticateWithGoogle() async =>
      await _authenticateWithGoogle();
  Future<Either<AuthException, User>> authenticateWithApple() async =>
      await _authenticateWithApple();
  Future<Either<AuthException, User>> authenticateAnonymously() async =>
      await _authenticateAnonymously();
  Future<void> signOut() async => await _signOut();
}

class AuthenticateAnonymouslyCubit extends Cubit<AuthenticationState> {
  AuthenticateAnonymouslyCubit() : super(const AuthenticationState.unAuthenticated());

  Future call() async {
    emit(const AuthenticationState.processing());
    try {
      final bloc = sl<AuthenticationBloc>();
      final response = await bloc.authenticateAnonymously();
      response.fold(
        (l) => emit(AuthenticationState.failedToAuthenticate(
          failureMessage: l.message,
          failureDetails: l.details,
        )),
        (r) => emit(AuthenticationState.authenticated(r)),
      );
    } on () {
      emit(const AuthenticationState.unAuthenticated());
    }
  }
}

class AuthenticateUserCubit extends Cubit<AuthenticationState> {
  AuthenticateUserCubit() : super(const AuthenticationState.unAuthenticated());

  Future call(FederatedProvider federatedProvider) async {
    emit(const AuthenticationState.processing());
    try {
      if (federatedProvider == FederatedProvider.google) {
        final bloc = sl<AuthenticationBloc>();
        final response = await bloc.authenticateWithGoogle();
        response.fold(
          (l) {
            debugPrint('error');
            emit(AuthenticationState.failedToAuthenticate(
              failureMessage: l.message,
              failureDetails: l.details,
            ));
          },
          (user) {
            debugPrint('data');
            emit(AuthenticationState.authenticated(user));
          },
        );
      } else if (federatedProvider == FederatedProvider.apple) {
        final bloc = sl<AuthenticationBloc>();
        final response = await bloc.authenticateWithApple();
        response.fold(
          (l) => emit(AuthenticationState.failedToAuthenticate(
            failureMessage: l.message,
            failureDetails: l.details,
          )),
          (r) => emit(AuthenticationState.authenticated(r)),
        );
      }
    } on () {
      emit(const AuthenticationState.unAuthenticated());
    }
  }
}
