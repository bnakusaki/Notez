import 'package:firebase_auth/firebase_auth.dart';
import 'package:notez/features/authentication/domain/repository/authentication_repository.dart';

class GetCurrentUser {
  GetCurrentUser(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  User? call() => _authenticationRepository.getCurrentUser();
}
