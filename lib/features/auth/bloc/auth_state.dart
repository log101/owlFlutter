part of 'auth_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

@immutable
abstract class AuthState extends Equatable {}

class Unauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  Authenticated(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}
