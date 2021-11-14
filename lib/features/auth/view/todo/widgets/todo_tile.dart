import 'package:auth/features/auth/model/model.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  TodoTile(this.todo);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(12.0),
      leading: Image.network(todo.imageurl),
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
