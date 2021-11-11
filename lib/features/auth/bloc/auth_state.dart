part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {}
