import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String newDesc) {
    final newTodo = TodoModel(description: newDesc);
    final newTodoList = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodoList));
  }

  void updateTodo(String targetTodoId, String newDesc) {
    final newTodoList = state.todos.map((todo) {
      if (todo.id == targetTodoId) {
        return TodoModel(
            id: targetTodoId, description: newDesc, isDone: todo.isDone);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodoList));
  }

  void toggleTodoStatus(String targetTodoId) {
    final newTodoList = state.todos.map((todo) {
      if (todo.id == targetTodoId) {
        return TodoModel(
            id: targetTodoId,
            description: todo.description,
            isDone: !todo.isDone);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodoList));
  }

  void deleteTodo(String targetTodoId) {
    final newTodoList =
        state.todos.where((element) => element.id != targetTodoId).toList();
    emit(state.copyWith(todos: newTodoList));
  }
}
