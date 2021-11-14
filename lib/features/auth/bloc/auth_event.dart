part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthInitialize extends AuthEvent {}

class AuthSubmitted implements AuthEvent {
  AuthSubmitted(this.username, this.password);

  final String username;
  final String password;
}

class AuthChanged extends AuthEvent {
  AuthChanged(this.user);

  final User? user;
}

class AuthLoggedOut implements AuthEvent {}
