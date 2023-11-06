class AuthenticationState {}

class Initial implements AuthenticationState {}

class Loading implements AuthenticationState {}

class Success implements AuthenticationState {}

class Failure implements AuthenticationState {
  Failure(this.message);
  final String message;
}
