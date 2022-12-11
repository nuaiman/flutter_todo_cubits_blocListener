part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<TodoModel> todos;
  const TodoListState({
    required this.todos,
  });

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => true;

  TodoListState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  factory TodoListState.initial() {
    return TodoListState(
      todos: [
        TodoModel(id: '1', description: 'Do the dishes'),
        TodoModel(id: '2', description: 'Clean the room'),
        TodoModel(id: '3', description: 'Mow the lawn'),
      ],
    );
  }
}
