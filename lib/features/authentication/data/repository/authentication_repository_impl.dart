import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/data/data_source/remote/authentication_remote_data_source.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  Future<Either<AuthException, User>> authenticateWithGoogle() async {
    try {
      final response = await _remoteDataSource.authenticateWithGoogle();
      return Right(response);
    } on AuthException catch (e) {
      return Left(AuthException(e.message, e.details));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AuthException, User>> authenticateAnonymously() async {
    try {
      final response = await _remoteDataSource.authenticateAnonymously();
      return Right(response);
    } on AuthException catch (e) {
      return Left(AuthException(e.message, e.details));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AuthException, User>> authenticateWithApple() async {
    try {
      final response = await _remoteDataSource.authenticateWithApple();
      return Right(response);
    } on AuthException catch (e) {
      return Left(AuthException(e.message, e.details));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AuthException, void>> signOut() async {
    try {
      final response = await _remoteDataSource.signOut();
      return Right(response);
    } on AuthException catch (e) {
      return Left(AuthException(e.message, e.details));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Either<AuthException, User?> currentUser() {
    try {
      final response = _remoteDataSource.currentUser();
      return Right(response);
    } on AuthException catch (e) {
      return Left(AuthException(e.message, e.details));
    } catch (e) {
      rethrow;
    }
  }
}
