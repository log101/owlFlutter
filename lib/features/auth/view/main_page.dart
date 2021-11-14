import 'package:auth/features/auth/auth.dart';
import 'package:auth/features/auth/bloc/auth_bloc.dart';
import 'package:auth/features/auth/view/initializing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Initial) {
        return InitializingPage();
      } else if (state is Authenticated) {
        return MainPage();
      } else {
        return LoginPage();
      }
    });
  }
}
