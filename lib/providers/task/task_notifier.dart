import 'package:first_flutter_project/data/data.dart';
import 'package:first_flutter_project/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _taskRepository;
  TaskNotifier(this._taskRepository) : super(const TaskState.initial()){
    getTasks();
  }

  Future<void> createTask(Task task) async {
   try {
      await _taskRepository.createTask(task);
      getTasks();
     
    } catch (e) {
      debugPrint(e.toString());
    }
  }
   Future<void> updateTask(Task task) async {
   try {
    final isCompleted =!task.isCompleted;
    final updateTask =task.copyWith(isCompleted: isCompleted);

      await _taskRepository.updateTask(updateTask);
      getTasks();
     
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getTasks() async {
   try {
      final tasks = await _taskRepository.getAllTasks();
      state = state.copyWith(tasks: tasks);
     
    } catch (e) {
      debugPrint(e.toString());
    }
  }


   Future<void> deleteTask(Task task) async {
   try {
      await _taskRepository.deleteTask(task);
      getTasks();
     
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}