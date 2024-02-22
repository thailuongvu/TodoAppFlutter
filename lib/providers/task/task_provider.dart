import 'package:first_flutter_project/data/data.dart';
import 'package:first_flutter_project/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = StateNotifierProvider<TaskNotifier,TaskState>((ref){
  final repository =ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
}
    );