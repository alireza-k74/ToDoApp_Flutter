import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp_flutter/blocs/todo_cubit.dart';
import 'package:todoapp_flutter/models/todo.dart';

class TaskListItem extends StatelessWidget {
  final int index;
  final Todo todo;

  const TaskListItem({
    super.key,
    required this.index,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();

    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) {
          todoCubit.toggleTodoCompletion(index);
        },
      ),
      onLongPress: () => todoCubit.deleteTodoAt(index),
    );
  }
}
