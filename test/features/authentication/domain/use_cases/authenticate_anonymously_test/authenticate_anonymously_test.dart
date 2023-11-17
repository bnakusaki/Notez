import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';
import 'package:notez/features/authentication/domain/use_cases/authenticate_anonymously.dart';

import '../sample_responses.dart';
import 'authenticate_anonymously_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  late MockAuthenticationRepository authenticationRepository;
  late AuthenticateAnonymously authenticateAnonymously;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    authenticateAnonymously = AuthenticateAnonymously(authenticationRepository);
  });

  group(
      'Authenticate anonymous use case should be able to revieve user credentials and auth exceptions',
      () {
    test('Should recieve user credential', () async {
      // Arrange.
      when(authenticationRepository.authenticateAnonymously())
          .thenAnswer((_) async => await sampleUser);

      // Act.
      final response = await authenticateAnonymously();

      // Assert.
      response.fold(
        (l) => null,
        (r) => expect(r, user),
      );
      verify(authenticationRepository.authenticateAnonymously()).called(1);
    });
    test('Should revieve an exception.', () async {
      // Arrange.
      when(authenticationRepository.authenticateAnonymously())
          .thenAnswer((_) async => await sampleAuthException);

      // Act.
      final response = await authenticateAnonymously();

      // Assert.
      response.fold(
        (l) => expect(l, exception),
        (r) => null,
      );
      verify(authenticationRepository.authenticateAnonymously()).called(1);
    });
  });
}
