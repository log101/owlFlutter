part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState(this.user);

  final User? user;
}

class Initial extends AuthState {
  const Initial(User? user) : super(user);

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
  const Unauthenticated(User? user) : super(user);

  @override
  List<Object?> get props => [user];
}

class Authenticated extends AuthState {
  const Authenticated(User? user) : super(user);

  @override
  List<Object?> get props => [user];
}
