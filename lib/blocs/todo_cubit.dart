import 'package:bloc/bloc.dart';

import 'package:todoapp_flutter/models/todo.dart';
import 'package:todoapp_flutter/repository/todo_repository.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepository repository;

  TodoCubit(this.repository) : super([]) {
    loadTodos();
  }

  void loadTodos() async {
    final todos = await repository.getTodos();
    emit(todos);
  }

  void addTodo(String title) async {
    final List<Todo> todos = List.from(state)..add(Todo(title: title));
    await repository.saveTodos(todos);
    emit(todos);
  }

  void toggleTodoCompletion(int index) async {
    final List<Todo> todos = List.from(state);
    todos[index].isCompleted = !todos[index].isCompleted;
    await repository.saveTodos(todos);
    emit(todos);
  }

  void deleteTodoAt(int index) async {
    final List<Todo> todos = List.from(state)..removeAt(index);
    await repository.saveTodos(todos);
    emit(todos);
  }
}
