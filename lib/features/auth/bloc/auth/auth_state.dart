part of 'auth_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

@immutable
abstract class AuthState extends Equatable {
  AuthState(this.user);

  final User? user;
}

class Initial extends AuthState {
  Initial(User? user) : super(user);

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
  Unauthenticated(User? user) : super(user);

  @override
  List<Object?> get props => [user];
}

class Authenticated extends AuthState {
  Authenticated(User? user) : super(user);

  @override
  List<Object?> get props => [user];
}
