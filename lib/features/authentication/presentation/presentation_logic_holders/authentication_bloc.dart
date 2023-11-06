// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/authentication/domain/entities/federated_provider.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_anonymously.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_apple.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_google.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_state.dart';
import 'package:notez/features/note/note_dependency_injection.dart';
import 'package:notez/shared/exceptions.dart';

class AuthenticationBloc {
  AuthenticationBloc(
    this._authenticateWithGoogle,
    this._authenticateWithApple,
    this._authenticateAnonymously,
  );

  final AuthenticateWithGoogle _authenticateWithGoogle;
  final AuthenticateWithApple _authenticateWithApple;
  final AuthenticateAnonymously _authenticateAnonymously;

  Future<Either<Exception, UserCredential>> authenticateWithGoogle() async =>
      await _authenticateWithGoogle();
  Future<Either<Exception, UserCredential>> authenticateWithApple() async =>
      await _authenticateWithApple();
  Future<Either<Exception, UserCredential>> authenticateAnonymously() async =>
      await _authenticateAnonymously();
}

class AuthenticateUser extends Cubit<AuthenticationState> {
  AuthenticateUser() : super(Initial());

  Future execute(FederatedProvider federatedProvider) async {
    emit(Loading());
    try {
      if (federatedProvider == FederatedProvider.google) {
        final bloc = sl<AuthenticationBloc>();
        final response = await bloc.authenticateWithGoogle();
        response.fold((l) => emit(Failure((l as AuthException).message)), (r) => emit(Success()));
      } else if (federatedProvider == FederatedProvider.apple) {
        final bloc = sl<AuthenticationBloc>();
        final response = await bloc.authenticateWithGoogle();
        response.fold((l) => emit(Failure((l as AuthException).message)), (r) => emit(Success()));
      } else if (federatedProvider == FederatedProvider.anonymous) {
        final bloc = sl<AuthenticationBloc>();
        final response = await bloc.authenticateAnonymously();
        response.fold((l) => emit(Failure((l as AuthException).message)), (r) => emit(Success()));
      }
    } on () {
      emit(Failure('Oops something unexpected happened.'));
    }
  }
}
