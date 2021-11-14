part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState(this.todos);

  final List<Todo> todos;

  @override
  List<Object> get props => [todos];
}

class TodoNotLoaded extends TodoState {
  TodoNotLoaded(List<Todo> todos) : super(todos);
}

class TodoLoading extends TodoState {
  TodoLoading(List<Todo> todos) : super(todos);
}

class TodoLoaded extends TodoState {
  const TodoLoaded(this._todos) : super(_todos);

  final List<Todo> _todos;

  List<Todo> get todos => _todos;

  @override
  List<Object> get props => [todos];
}
