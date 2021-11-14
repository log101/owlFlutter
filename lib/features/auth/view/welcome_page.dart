import 'package:auth/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.read<AuthBloc>().add(AuthLoggedOut()),
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(children: [
          Text("Merhaba"),
        ]),
      ),
    );
  }
}
