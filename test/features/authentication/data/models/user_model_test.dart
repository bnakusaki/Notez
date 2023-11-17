import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notez/features/authentication/data/model/user_model.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';

import 'user_model_test.mocks.dart';

@GenerateMocks([firebase_auth.User])
void main() {
  late MockUser user;

  setUp(() {
    user = MockUser();
  });

  const UserModel userModel = UserModel(
    uid: 'test',
    displayName: 'test',
    photoUrl: 'test',
  );

  group('User  model', () {
    test('should be a subclass of the user class', () {
      // Assert.
      expect(userModel, isA<User>());
    });

    test('should be able to parse User from firebase to UserModel object', () {
      // Arrange.
      when(user.uid).thenAnswer((_) => 'test');
      when(user.displayName).thenAnswer((_) => 'test');
      when(user.photoURL).thenAnswer((_) => 'test');

      // Act.
      final response = UserModel.fromUser(user);

      // Assert.
      expect(response, userModel);
      expect(response, isA<UserModel>());
      verify(user.uid).called(1);
      verify(user.displayName).called(1);
      verify(user.photoURL).called(1);
    });
  });
}
