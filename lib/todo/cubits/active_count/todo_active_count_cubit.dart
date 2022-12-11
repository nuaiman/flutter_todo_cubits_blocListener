import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_active_count_state.dart';

class TodoActiveCountCubit extends Cubit<TodoActiveCountState> {
  final int initialActiveCount;
  TodoActiveCountCubit({
    required this.initialActiveCount,
  }) : super(TodoActiveCountState(activeCount: initialActiveCount));

  void calculateActiveTodoCount(int activeTodoCount) {
    emit(state.copyWith(activeCount: activeTodoCount));
  }
}
