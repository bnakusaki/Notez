import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_anonymously.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_apple.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_google.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

@GenerateMocks([AuthenticationRepository])
import 'use_cases_test.mocks.dart';

void main() {
  late MockAuthenticationRepository authenticationRepository;
  late AuthenticateWithGoogle authenticateWithGoogle;
  late AuthenticateWithApple authenticateWithApple;
  late AuthenticateAnonymously authenticateAnonymously;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    authenticateWithGoogle = AuthenticateWithGoogle(authenticationRepository);
    authenticateWithApple = AuthenticateWithApple(authenticationRepository);
    authenticateAnonymously = AuthenticateAnonymously(authenticationRepository);
  });

  User user = const User(
    uid: 'testUserId',
    displayName: 'test user',
    photoUrl: 'test.com',
  );

  AuthException exception = const AuthenticateWithFederatedProviderFailure();

  Future<Either<AuthException, User>> sampleUser = Future.value(Right(user));
  Future<Either<AuthException, User>> sampleAuthException = Future.value(Left(exception));

  group('All authentication use cases makes call to the auth repository', () {
    test('AuthenticateWithGoogle use case for user', () async {
      // arrange.
      when(authenticationRepository.authenticateWithGoogle())
          .thenAnswer((_) async => await sampleUser);

      // act.
      final response = await authenticateWithGoogle();

      // assert.
      response.fold(
        (l) => null,
        (r) => expect(r, user),
      );
      verify(authenticationRepository.authenticateWithGoogle()).called(1);
    });
    test('AuthenticateWithGoogle use case for failure', () async {
      // arrange.
      when(authenticationRepository.authenticateWithGoogle())
          .thenAnswer((_) async => await sampleAuthException);

      // act.
      final response = await authenticateWithGoogle();

      // assert.
      response.fold(
        (l) => expect(l, exception),
        (r) => null,
      );
      verify(authenticationRepository.authenticateWithGoogle()).called(1);
    });
    test('AuthenticateWithApple use case for user', () async {
      // arrange.
      when(authenticationRepository.authenticateWithApple())
          .thenAnswer((_) async => await sampleUser);

      // act.
      final response = await authenticateWithApple();

      // assert.
      response.fold(
        (l) => null,
        (r) => expect(r, user),
      );
      verify(authenticationRepository.authenticateWithApple()).called(1);
    });
    test('AuthenticateWithApple use case for failure', () async {
      // arrange.
      when(authenticationRepository.authenticateWithApple())
          .thenAnswer((_) async => await sampleAuthException);

      // act.
      final response = await authenticateWithApple();

      // assert.
      response.fold(
        (l) => expect(l, exception),
        (r) => null,
      );
      verify(authenticationRepository.authenticateWithApple()).called(1);
    });
    test('AuthenticateAnonymously use case for user', () async {
      // arrange.
      when(authenticationRepository.authenticateAnonymously())
          .thenAnswer((_) async => await sampleUser);

      // act.
      final response = await authenticateAnonymously();

      // assert.
      response.fold(
        (l) => null,
        (r) => expect(r, user),
      );
      verify(authenticationRepository.authenticateAnonymously()).called(1);
    });
    test('AuthenticateAnonymously use case for failure', () async {
      // arrange.
      when(authenticationRepository.authenticateAnonymously())
          .thenAnswer((_) async => await sampleAuthException);

      // act.
      final response = await authenticateAnonymously();

      // assert.
      response.fold(
        (l) => expect(l, exception),
        (r) => null,
      );
      verify(authenticationRepository.authenticateAnonymously()).called(1);
    });
  });
}
