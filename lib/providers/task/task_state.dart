// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:first_flutter_project/data/data.dart';

class TaskState extends Equatable {
  final List<Task> tasks;
  const TaskState(
    this.tasks,
  );
  const TaskState.initial({this.tasks = const [],});


  @override
  List<Object> get props => [tasks];

  TaskState copyWith({
    List<Task>? tasks,
  }) {
    return TaskState(
      tasks ?? this.tasks,
    );
  }
}
