import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class ListTodosPage extends StatelessWidget {
  const ListTodosPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Center(
          child: Column(children: [
            for (var todo in state.todos) TodoTile(todo),
          ]),
        );
      },
    );
  }
}
