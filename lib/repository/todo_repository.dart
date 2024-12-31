import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todoapp_flutter/models/todo.dart';

class TodoRepository {
  static const String todoKey = 'todos';

  Future<List<Todo>> getTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosJson = prefs.getString(todoKey);
    if (todosJson == null) {
      return [];
    }
    final List<dynamic> jsonList = jsonDecode(todosJson);
    return jsonList.map((json) => Todo.fromJson(json)).toList();
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final String todosJson =
        jsonEncode(todos.map((todo) => todo.toJson()).toList());
    await prefs.setString(todoKey, todosJson);
  }
}
