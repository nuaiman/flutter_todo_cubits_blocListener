import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/todo_barrel.dart';
import '../models/todo_model.dart';

class TodoListBuilder extends StatelessWidget {
  const TodoListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosCubit>().state.todos;
    return MultiBlocListener(
      listeners: [
        // ---------------------------------------------------------------------
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            context.read<FilteredTodosCubit>().getFilteredTodos(
                  context.read<TodoFilterCubit>().state.filter,
                  state.todos,
                  context.read<TodoSearchCubit>().state.searchTerm,
                );
          },
        ),
        // ---------------------------------------------------------------------
        BlocListener<TodoFilterCubit, TodoFilterState>(
          listener: (context, state) {
            context.read<FilteredTodosCubit>().getFilteredTodos(
                  state.filter,
                  context.read<TodoListCubit>().state.todos,
                  context.read<TodoSearchCubit>().state.searchTerm,
                );
          },
        ),
        // ---------------------------------------------------------------------
        BlocListener<TodoSearchCubit, TodoSearchState>(
          listener: (context, state) {
            context.read<FilteredTodosCubit>().getFilteredTodos(
                  context.read<TodoFilterCubit>().state.filter,
                  context.read<TodoListCubit>().state.todos,
                  state.searchTerm,
                );
          },
        ),
        // ---------------------------------------------------------------------
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: todos.length,
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        itemBuilder: (context, index) {
          return todoItem(context, todos[index]);
        },
      ),
    );
  }

  Widget todoItem(BuildContext context, TodoModel todo) {
    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (direction) {
        context.read<TodoListCubit>().deleteTodo(todo.id);
      },
      direction: DismissDirection.endToStart,
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (_) {
            context.read<TodoListCubit>().toggleTodoStatus(todo.id);
          },
        ),
        title: Text(todo.description),
      ),
    );
  }
}
