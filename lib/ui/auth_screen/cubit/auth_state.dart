sealed class AuthState {}

class AuthInitialState extends AuthState {}

class AuthSuccessSavedIdState extends AuthState {}

class AuthSuccessGotIdState extends AuthState {
  AuthSuccessGotIdState(this.userId);

  final String userId;
}
