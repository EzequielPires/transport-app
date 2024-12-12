import 'package:app/layers/domain/entities/user.dart';

class AuthResponse {
  final bool success;
  final User? user;
  final String? token;
  final String? error;

  AuthResponse({required this.success, this.token, this.user, this.error});
}

abstract class AuthRepository {
  Future<AuthResponse> signin(String email, String password);
  Future<AuthResponse?> load();
  Future<AuthResponse> signup(User user);
  Future<void> signout();
}
