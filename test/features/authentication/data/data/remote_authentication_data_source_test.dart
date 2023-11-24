import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notez/features/authentication/data/data_source/remote/remote_authentication_database.dart';
import 'package:notez/features/authentication/data/model/user_model.dart';
import 'package:notez/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/shared/exceptions/auth_exception.dart';

import 'remote_authentication_data_source_test.mocks.dart';

@GenerateMocks([AuthenticationRemoteDataSource, firebase_auth.User])
void main() {
  late AuthenticationRepositoryImpl repositoryImpl;
  late MockAuthenticationRemoteDataSource database;
  late MockUser user;

  setUp(() {
    database = MockAuthenticationRemoteDataSource();
    repositoryImpl = AuthenticationRepositoryImpl(database);
    user = MockUser();
  });
  group('Authentication database returns approporaite responses', () {
    test('Returns user when authenticating with Google', () async {
      // Arrange.
      when(database.authenticateWithGoogle()).thenAnswer((_) async => UserModel.fromUser(user));

      // Act.
      final response = await repositoryImpl.authenticateWithGoogle();

      // Assert.
      expect(response, isA<User>());
      verify(database.authenticateWithGoogle()).called(1);
    });
    test('Returns auth exceptino when authenticating with Google fails', () async {
      // Arrange.
      when(database.authenticateWithGoogle()).thenAnswer(
        (_) async => throw const AuthenticateWithFederatedProviderFailure(),
      );

      // Act.
      final response = await repositoryImpl.authenticateWithGoogle();

      // Assert.
      expect(response, isA<AuthException>());
      verify(database.authenticateWithGoogle()).called(1);
    });
  });
}
