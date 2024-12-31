import 'package:hive/hive.dart';
import 'package:todoapp_flutter/models/todo.dart';

class TodoRepository {
  final Box<Todo> todoBox;

  TodoRepository(this.todoBox);

  List<Todo> getTodos() => todoBox.values.toList();

  void addTodo(Todo todo) => todoBox.add(todo);

  void deleteTodoAt(int index) => todoBox.deleteAt(index);

  void updateTodoAt(int index, Todo todo) {
    todoBox.putAt(index, todo);
  }
}
