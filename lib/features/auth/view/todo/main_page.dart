import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoMainPage extends StatefulWidget {
  const TodoMainPage({Key? key}) : super(key: key);

  @override
  _TodoMainPageState createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => context.read<AuthBloc>().add(AuthLoggedOut()),
                icon: Icon(Icons.logout)),
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return Center(
              child: Column(children: [
                for (var todo in state.todos) Text(todo.title),
              ]),
            );
          },
        ),
      ),
    );
  }
}
