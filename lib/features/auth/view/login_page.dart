import 'package:auth/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    if (context.read<AuthBloc>().state is Authenticated) {
      return WelcomePage();
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              onChanged: (val) => _username = val,
            ),
            TextFormField(
              onChanged: (val) => _password = val,
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthBloc>()
                      .add(AuthSubmitted(_username, _password));
                  print("$_username, $_password");
                  setState(() {});
                },
                child: Text("Submit")),
          ],
        )),
      );
    }
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text("Merhaba"),
        ]),
      ),
    );
  }
}
