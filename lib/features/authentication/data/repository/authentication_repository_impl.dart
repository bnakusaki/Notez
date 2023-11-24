import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/data/data_source/remote/remote_authentication_database.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

/// Implementation of AuthenticationRepository interface.
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AuthException, User>> authenticateAnonymously() async {
    try {
      final response = await remoteDataSource.authenticateAnonymously();
      return Right(response);
    } on AuthException catch (e) {
      return Left(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AuthException, User>> authenticateWithApple() async {
    try {
      final response = await remoteDataSource.authenticateWithApple();
      return Right(response);
    } on AuthException catch (e) {
      return Left(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AuthException, User>> authenticateWithGoogle() async {
    try {
      final response = await remoteDataSource.authenticateWithGoogle();
      return Right(response);
    } on AuthException catch (e) {
      return Left(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AuthException, void>> logOut() async {
    try {
      final response = await remoteDataSource.signOut();
      return Right(response);
    } on AuthException catch (e) {
      return Left(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Either<AuthException, User?> getCurrentUser() {
    try {
      final response = remoteDataSource.getCurrentUser();
      return Right(response);
    } on AuthException catch (e) {
      return Left(e);
    } catch (e) {
      rethrow;
    }
  }
}
