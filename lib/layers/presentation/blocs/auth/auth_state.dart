import 'package:app/layers/domain/entities/user.dart';

abstract class AuthState {
  final User? user;
  final String? token;

  AuthState({this.token, this.user});
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  Authenticated({required super.user, required super.token});
}

class Unauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}
