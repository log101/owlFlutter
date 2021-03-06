import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:auth/features/auth/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(this.todo, {Key? key}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.read<TodoBloc>().add(TodoMarked(todo)),
      contentPadding: EdgeInsets.all(12.0),
      leading: Image.network(
          "https://via.placeholder.com/40"), // Image.network(todo.imageurl)
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(todo.title),
        Text(todo.howto, style: TextStyle(color: Colors.grey)),
      ]),
      trailing: Icon(
        (todo.done) ? Icons.task_alt_outlined : Icons.error_outline_outlined,
        color: (todo.done) ? Colors.green : Colors.red,
      ),
    );
  }
}
