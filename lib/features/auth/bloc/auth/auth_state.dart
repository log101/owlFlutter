part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState(this.user);

  final User? user;

  @override
  List<Object?> get props => [user];
}

class Initial extends AuthState {
  const Initial(User? user) : super(user);
}

class Unauthenticated extends AuthState {
  const Unauthenticated(User? user) : super(user);
}

class Authenticated extends AuthState {
  const Authenticated(User? user) : super(user);
}
