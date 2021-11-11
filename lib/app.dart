import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auth/features/features.dart';

class AuthApp extends StatelessWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: LoginPage(),
        ),
      ),
    );
  }
}
