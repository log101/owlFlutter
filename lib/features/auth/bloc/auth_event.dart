part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthSubmitted implements AuthEvent {
  AuthSubmitted(this.username, this.password);

  final String username;
  final String password;
}

class AuthLoggedOut implements AuthEvent {}
