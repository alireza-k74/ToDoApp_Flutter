import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutter/blocs/theme_cubit.dart';
import 'package:todoapp_flutter/blocs/todo_cubit.dart';
import 'package:todoapp_flutter/models/todo.dart';
import 'package:todoapp_flutter/screens/add_task_screen.dart';
import 'package:todoapp_flutter/widgets/task_list_item.dart';

class ListTasksScreen extends StatelessWidget {
  const ListTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          if (todos.isEmpty) {
            return Center(child: Text('No TODOs available.'));
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return TaskListItem(index: index, todo: todos[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AddTaskScreen()),
        ),
      ),
    );
  }
}
