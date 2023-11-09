import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notez/features/authentication/data/data_source/remote/authentication_remote_data_source.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Exception, UserCredential>> authenticateWithGoogle() async =>
      _remoteDataSource.authenticateWithGoogle();

  @override
  Future<Either<Exception, UserCredential>> authenticateWithApple() async =>
      await _remoteDataSource.authenticateWithApple();

  @override
  Future<Either<Exception, UserCredential>> authenticateAnonymously() async =>
      await _remoteDataSource.authenticateAnonymously();

  @override
  Future<void> signOut() async => await _remoteDataSource.signOut();

  @override
  User? getCurrentUser() => _remoteDataSource.getCurrentUser();
}
