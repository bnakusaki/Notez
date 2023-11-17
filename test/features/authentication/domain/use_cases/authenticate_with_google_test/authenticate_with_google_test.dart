import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_with_google.dart';

import '../authenticate_anonymously_test/authenticate_anonymously_test.mocks.dart';
import '../sample_responses.dart';

void main() {
  late MockAuthenticationRepository authenticationRepository;
  late AuthenticateWithGoogle authenticateWithGoogle;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    authenticateWithGoogle = AuthenticateWithGoogle(authenticationRepository);
  });

  group(
      'Authenticate with Google use case should be able to revieve user credentials and auth exceptions',
      () {
    test('Should recieve user credential', () async {
      // Arrange.
      when(authenticationRepository.authenticateWithGoogle())
          .thenAnswer((_) async => await sampleUser);

      // Act.
      final response = await authenticateWithGoogle();

      // Assert.
      response.fold(
        (l) => null,
        (r) => expect(r, user),
      );
      verify(authenticationRepository.authenticateWithGoogle()).called(1);
    });
    test('Should revieve an exception.', () async {
      // Arrange.
      when(authenticationRepository.authenticateWithGoogle())
          .thenAnswer((_) async => await sampleAuthException);

      // Act.
      final response = await authenticateWithGoogle();

      // Assert.
      response.fold(
        (l) => expect(l, exception),
        (r) => null,
      );
      verify(authenticationRepository.authenticateWithGoogle()).called(1);
    });
  });
}
