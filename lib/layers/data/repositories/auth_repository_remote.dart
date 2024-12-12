import 'dart:convert';

import 'package:app/core/services/api_service.dart';
import 'package:app/layers/domain/entities/user.dart';
import 'package:app/layers/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryRemote implements AuthRepository {
  final ApiService apiService;

  AuthRepositoryRemote({required this.apiService});

  @override
  Future<AuthResponse?> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString('user');
    final String? accessToken = prefs.getString('access_token');

    if (userData != null && accessToken != null) {
      apiService.setToken(accessToken);
      return AuthResponse(
        success: true,
        token: accessToken,
        user: User.fromJson(
          jsonDecode(userData),
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Future<AuthResponse> signin(String email, String password) async {
    try {
      var response = await apiService.post('auth/signin', data: {
        'email': email,
        'password': password,
      });

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final User user = User.fromJson(response['user']);
      String accessToken = response['access_token'];
      apiService.setToken(accessToken);

      prefs.setString('user', jsonEncode(user.toJson()));
      prefs.setString('access_token', accessToken);

      return AuthResponse(
        success: true,
        token: accessToken,
        user: user,
      );
    } catch (error) {
      return AuthResponse(
        success: false,
        error: error.toString(),
      );
    }
  }

  @override
  Future<void> signout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('access_token');
    apiService.clearToken();
  }

  @override
  Future<AuthResponse> signup(User user) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
