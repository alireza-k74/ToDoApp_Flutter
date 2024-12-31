import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import 'package:todoapp_flutter/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final Box<Todo> todoBox;

  TodoCubit(this.todoBox) : super(todoBox.values.toList());

  void addTodo(String title) {
    final todo = Todo(title: title);
    todoBox.add(todo);
    emit(todoBox.values.toList());
  }

  void toggleTodoCompletion(int index) {
    final todo = todoBox.getAt(index);
    if (todo != null) {
      todo.isCompleted = !todo.isCompleted;
      todo.save();
      emit(todoBox.values.toList());
    }
  }

  void deleteTodoAt(int index) {
    todoBox.deleteAt(index);
    emit(todoBox.values.toList());
  }
}
