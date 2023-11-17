import 'package:dartz/dartz.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

User user = const User(
  uid: 'testUserId',
  displayName: 'test user',
  photoUrl: 'test.com',
);

AuthException exception = const AuthenticateWithFederatedProviderFailure();

Future<Either<AuthException, User>> sampleUser = Future.value(Right(user));
Future<Either<AuthException, User>> sampleAuthException = Future.value(Left(exception));
