import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/data/data_source/remote/remote_authentication_database.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(this.remoteDataSource);

  final RemoteAuthenticationDatabase remoteDataSource;

  @override
  Future<Either<AuthException, User>> authenticateWithGoogle() async {
    try {
      final response = await remoteDataSource.authenticateWithGoogle();
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
      final response = await remoteDataSource.authenticateAnonymously();
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
      final response = await remoteDataSource.authenticateWithApple();
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
      final response = await remoteDataSource.signOut();
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
      final response = remoteDataSource.currentUser();
      return Right(response);
    } on AuthException catch (e) {
      return Left(AuthException(e.message, e.details));
    } catch (e) {
      rethrow;
    }
  }
}
