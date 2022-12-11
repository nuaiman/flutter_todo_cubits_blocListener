part of 'todo_active_count_cubit.dart';

class TodoActiveCountState extends Equatable {
  final int activeCount;
  const TodoActiveCountState({
    required this.activeCount,
  });

  @override
  List<Object> get props => [activeCount];

  @override
  bool get stringify => true;

  TodoActiveCountState copyWith({
    int? activeCount,
  }) {
    return TodoActiveCountState(
      activeCount: activeCount ?? this.activeCount,
    );
  }

  factory TodoActiveCountState.initial() {
    return const TodoActiveCountState(activeCount: 0);
  }
}
