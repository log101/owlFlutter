import 'package:auth/features/auth/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
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
                      },
                      child: Text("Submit")),
                ],
              )),
        ),
      );
    });
  }
}
