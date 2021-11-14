import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    on<AuthChanged>(_authChanged);
    _authRepository.user.listen((user) {
      add(AuthChanged(user));
    });
  }

  final AuthRepository _authRepository;

  FutureOr<void> _authSubmitted(AuthSubmitted event, Emitter<AuthState> emit) {
    _authRepository.logIn(event.username, event.password);
  }

  FutureOr<void> _authLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) {
    _authRepository.logOut();
  }

  FutureOr<void> _authChanged(AuthChanged event, Emitter<AuthState> emit) {
    if (event.user == null) {
      emit(Unauthenticated());
    } else {
      emit(Authenticated(event.user));
    }
  }
}
