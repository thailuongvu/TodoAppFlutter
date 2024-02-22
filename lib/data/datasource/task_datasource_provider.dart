import 'package:first_flutter_project/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskDatasourceProvider = Provider<TaskDataSource>((ref) {

  return TaskDataSource();
});