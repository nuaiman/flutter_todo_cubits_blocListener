import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo/cubits/todo_barrel.dart';
import 'todo/screen/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ---------------------------------------------------------------------
        BlocProvider<TodoFilterCubit>(create: (context) => TodoFilterCubit()),
        // ---------------------------------------------------------------------
        BlocProvider<TodoSearchCubit>(create: (context) => TodoSearchCubit()),
        // ---------------------------------------------------------------------
        BlocProvider<TodoListCubit>(create: (context) => TodoListCubit()),
        // ---------------------------------------------------------------------
        BlocProvider<TodoActiveCountCubit>(
          create: (context) => TodoActiveCountCubit(
            initialActiveCount:
                BlocProvider.of<TodoListCubit>(context).state.todos.length,
          ),
        ),
        // ---------------------------------------------------------------------
        BlocProvider<FilteredTodosCubit>(
          create: (context) => FilteredTodosCubit(
            initialTodoList:
                BlocProvider.of<TodoListCubit>(context).state.todos.toList(),
          ),
        ),
        // ---------------------------------------------------------------------
      ],
      child: MaterialApp(
        title: 'Flutter Todo Cubits & BlocListener',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
