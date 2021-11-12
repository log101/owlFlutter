part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class Unauthenticated extends AuthState {
  Unauthenticated({required this.username, required this.password});

  final String username;
  final String password;
}

class Authenticated extends AuthState {}
