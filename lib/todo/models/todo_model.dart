import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter { all, active, done }

Uuid uuid = const Uuid();

class TodoModel extends Equatable {
  final String id;
  final String description;
  final bool isDone;
  TodoModel({
    String? id,
    required this.description,
    this.isDone = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, description, isDone];

  @override
  bool get stringify => true;

  TodoModel copyWith({
    String? id,
    String? description,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
