import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp_flutter/blocs/theme_cubit.dart';
import 'package:todoapp_flutter/blocs/todo_cubit.dart';
import 'package:todoapp_flutter/repository/todo_repository.dart';
import 'package:todoapp_flutter/screens/list_tasks_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoRepository repository = TodoRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => TodoCubit(repository),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isLightTheme) {
          return MaterialApp(
            theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
            home: ListTasksScreen(),
          );
        },
      ),
    );
  }
}
