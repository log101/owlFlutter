part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoRequested extends TodoEvent {
  const TodoRequested(this.date);

  final DateTime date;

  @override
  List<Object> get props => [date];
}

class TodoRetrieved extends TodoEvent {}

class TodoDateChanged extends TodoEvent {
  const TodoDateChanged(this.date);

  final DateTime date;

  @override
  List<Object> get props => [date];
}

class TodoAdded extends TodoEvent {
  const TodoAdded(this.todo);

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class TodoMarked extends TodoEvent {
  const TodoMarked(this.todo);

  final Todo todo;

  @override
  List<Object> get props => [todo];
}
