import 'package:first_flutter_project/data/data.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource _dataSource;

  TaskRepositoryImpl(this._dataSource);

  @override
  Future<void> createTask(Task task) async {
    try {
      await _dataSource.addTask(task);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await _dataSource.deleteTask(task);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Task>> getAllTasks() async{
     try {
      return await _dataSource.getAllTasks();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateTask(Task task) async{
     try {
      await _dataSource.updateTask(task);
    } catch (e) {
      throw Exception(e);
    }
  }
}
