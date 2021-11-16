part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState(this.todos, this.date);

  final List<Todo> todos;
  final DateTime date;

  @override
  List<Object> get props => [todos, date];
}

class TodoNotLoaded extends TodoState {
  TodoNotLoaded(List<Todo> todos, date) : super(todos, date);
}

class TodoLoading extends TodoState {
  TodoLoading(List<Todo> todos, date) : super(todos, date);
}

class TodoLoaded extends TodoState {
  const TodoLoaded(this._todos, date) : super(_todos, date);

  final List<Todo> _todos;

  List<Todo> get todos => _todos;

  @override
  List<Object> get props => [todos, date];
}
