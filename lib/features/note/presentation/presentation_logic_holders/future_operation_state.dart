class FutureOperationState {}

class Initial implements FutureOperationState {}

class Loading implements FutureOperationState {}

class Success implements FutureOperationState {}

class Failure implements FutureOperationState {
  Failure(this.message);
  final String message;
}
