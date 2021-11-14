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
        super(TodoNotLoaded(const [])) {
    on<TodoRequested>(_todoRequested);
    add(TodoRequested());
  }

  final TodoRepository _todoRepository;

  FutureOr<void> _todoRequested(
      TodoRequested event, Emitter<TodoState> emit) async {
    emit(TodoLoading(const []));
    final todos = await _todoRepository.getTodos();
    emit(TodoLoaded(todos));
  }
}
