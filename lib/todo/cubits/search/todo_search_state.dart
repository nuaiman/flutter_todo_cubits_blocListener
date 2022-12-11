part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;
  const TodoSearchState({
    required this.searchTerm,
  });

  @override
  List<Object> get props => [searchTerm];

  @override
  bool get stringify => true;

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: '');
  }
}
