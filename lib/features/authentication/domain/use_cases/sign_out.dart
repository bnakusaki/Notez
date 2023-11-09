import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';

class SignOut {
  SignOut(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  Future<void> call() async => await _authenticationRepository.signOut();
}
