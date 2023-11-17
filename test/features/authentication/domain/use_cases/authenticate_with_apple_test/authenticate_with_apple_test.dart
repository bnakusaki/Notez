import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_apple.dart';

import '../authenticate_anonymously_test/authenticate_anonymously_test.mocks.dart';
import '../sample_responses.dart';

void main() {
  late MockAuthenticationRepository authenticationRepository;
  late AuthenticateWithApple authenticateWithApple;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    authenticateWithApple = AuthenticateWithApple(authenticationRepository);
  });

  group(
      'Authenticate with Apple use case should be able to revieve user credentials and auth exceptions',
      () {
    test('Should recieve user credential', () async {
      // Arrange.
      when(authenticationRepository.authenticateWithApple())
          .thenAnswer((_) async => await sampleUser);

      // Act.
      final response = await authenticateWithApple();

      // Assert.
      response.fold(
        (l) => null,
        (r) => expect(r, user),
      );
      verify(authenticationRepository.authenticateWithApple()).called(1);
    });
    test('Should revieve an exception.', () async {
      // Arrange.
      when(authenticationRepository.authenticateWithApple())
          .thenAnswer((_) async => await sampleAuthException);

      // Act.
      final response = await authenticateWithApple();

      // Assert.
      response.fold(
        (l) => expect(l, exception),
        (r) => null,
      );
      verify(authenticationRepository.authenticateWithApple()).called(1);
    });
  });
}
