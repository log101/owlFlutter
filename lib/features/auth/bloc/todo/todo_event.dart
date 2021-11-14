part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoRequested extends TodoEvent {}

class TodoRetrieved extends TodoEvent {}
