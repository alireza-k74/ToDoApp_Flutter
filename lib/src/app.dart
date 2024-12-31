import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:todoapp_flutter/blocs/theme_cubit.dart';
import 'package:todoapp_flutter/blocs/todo_cubit.dart';
import 'package:todoapp_flutter/models/todo.dart';
import 'package:todoapp_flutter/screens/list_tasks_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => TodoCubit(Hive.box<Todo>('todos')),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Flutter TODO App',
            themeMode: themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: ListTasksScreen(),
          );
        },
      ),
    );
  }
}
