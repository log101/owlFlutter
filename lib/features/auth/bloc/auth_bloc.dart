import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(Unauthenticated()) {
    on<AuthSubmitted>(_authSubmitted);
    on<AuthLoggedOut>(_authLoggedOut);
  }

  final AuthRepository _authRepository;

  FutureOr<void> _authSubmitted(AuthSubmitted event, Emitter<AuthState> emit) {
    _authRepository.logIn(event.username, event.password);
    if (_authRepository.user == null) {
      print("Couldn't login");
      emit(Unauthenticated());
    } else {
      print("User authenticated");
      emit(Authenticated(_authRepository.user));
    }
  }

  FutureOr<void> _authLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) {
    emit(Unauthenticated());
  }
}
