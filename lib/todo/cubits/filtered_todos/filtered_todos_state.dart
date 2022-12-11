part of 'filtered_todos_cubit.dart';

class FilteredTodosState extends Equatable {
  final List<TodoModel> todos;
  const FilteredTodosState({
    required this.todos,
  });

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => true;

  FilteredTodosState copyWith({
    List<TodoModel>? todos,
  }) {
    return FilteredTodosState(
      todos: todos ?? this.todos,
    );
  }

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(todos: []);
  }
}
