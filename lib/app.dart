import 'package:auth/features/auth/bloc/auth/auth_bloc.dart';
import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:auth/features/auth/repository/auth_repository.dart';
import 'package:auth/features/auth/repository/chatbot_repository.dart';
import 'package:auth/features/auth/view/initializing_page.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthApp extends StatelessWidget {
  AuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late DialogFlowtter dialogFlowtter;
    DialogFlowtter.fromFile(
            path: "assets/owl-app-dialogflow.json", sessionId: "12345678")
        .then((value) => dialogFlowtter = value);

    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: AuthRepository(FirebaseAuth.instance)),
      child: const InitializingPage(),
    );
  }
}
