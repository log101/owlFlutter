import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(Unauthenticated()) {
    on<AuthSubmitted>(_authSubmitted);
  }

  late StreamSubscription _authSubscription;
  final AuthRepository _authRepository;

  void _authSubmitted(AuthSubmitted event, Emitter emit) {}
}
