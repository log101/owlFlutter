import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthApp extends StatelessWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Merhaba"),
        ),
      ),
    );
  }
}
