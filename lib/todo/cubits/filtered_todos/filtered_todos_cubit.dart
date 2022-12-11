import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final List<TodoModel> initialTodoList;
  FilteredTodosCubit({
    required this.initialTodoList,
  }) : super(FilteredTodosState(todos: initialTodoList));

  void getFilteredTodos(
      Filter filter, List<TodoModel> todos, String searchTerm) {
    List<TodoModel> filteredTodos;

    switch (filter) {
      case Filter.active:
        filteredTodos = todos.where((element) => !element.isDone).toList();
        break;
      case Filter.done:
        filteredTodos = todos.where((element) => element.isDone).toList();
        break;
      case Filter.all:
        filteredTodos = todos.toList();
        break;
    }

    if (searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((element) =>
              element.description.toLowerCase().contains(searchTerm))
          .toList();
    }

    emit(state.copyWith(todos: filteredTodos));
  }
}
