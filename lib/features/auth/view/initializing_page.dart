import 'package:auth/features/auth/auth.dart';
import 'package:auth/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view.dart';

class InitializingPage extends StatefulWidget {
  const InitializingPage({Key? key}) : super(key: key);

  @override
  _InitializingPageState createState() => _InitializingPageState();
}

class _InitializingPageState extends State<InitializingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        return WelcomePage();
      } else if (state is Unauthenticated) {
        return LoginPage();
      } else
        return Center(child: CircularProgressIndicator());
    });
  }
}
