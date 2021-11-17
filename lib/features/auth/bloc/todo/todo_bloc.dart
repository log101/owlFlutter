import 'dart:async';

import 'package:auth/features/auth/model/model.dart';
import 'package:auth/features/auth/repository/todo_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TodoNotLoaded(const [], DateTime.now())) {
    on<TodoRequested>(_todoRequested);
    on<TodoDateChanged>(_todoDateChanged);
    on<TodoAdded>(_todoAdded);
    on<TodoMarked>(_todoMarked);
    add(TodoRequested(state.date));
  }

  final TodoRepository _todoRepository;

  FutureOr<void> _todoRequested(
      TodoRequested event, Emitter<TodoState> emit) async {
    emit(TodoLoading(const [], event.date));
    final todos = await _todoRepository.getTodos(event.date);
    emit(TodoLoaded(todos, event.date));
  }

  FutureOr<void> _todoDateChanged(
      TodoDateChanged event, Emitter<TodoState> emit) {
    add(TodoRequested(event.date));
  }

  FutureOr<void> _todoAdded(TodoAdded event, Emitter<TodoState> emit) {
    _todoRepository.addTodo(event.todo);
  }

  FutureOr<void> _todoMarked(TodoMarked event, Emitter<TodoState> emit) {
    _todoRepository.markTodo(event.todo.id, !event.todo.done);
    add(TodoRequested(state.date));
  }
}
