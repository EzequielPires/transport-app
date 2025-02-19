abstract class AuthEvent {}

class AuthSignin extends AuthEvent {
  final String email;
  final String password;

  AuthSignin({
    required this.email,
    required this.password,
  });
}

class AuthLogout extends AuthEvent {}

class AuthLoad extends AuthEvent {}
