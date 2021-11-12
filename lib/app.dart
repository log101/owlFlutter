import 'package:auth/features/auth/bloc/auth_bloc.dart';
import 'package:auth/features/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthApp extends StatelessWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocProvider(
            create: (context) =>
                AuthBloc(authRepository: AuthRepository(FirebaseAuth.instance)),
            child: LoginPage(),
          ),
        ),
      ),
    );
  }
}
