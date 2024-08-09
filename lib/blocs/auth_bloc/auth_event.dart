abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested(this.email, this.password);
}

class AuthRegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  AuthRegisterRequested(this.name, this.email, this.password, this.confirmPassword);
}

class AuthLogoutRequested extends AuthEvent {}
