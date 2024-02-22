import 'package:flutter/material.dart';
import 'package:first_flutter_project/utils/task_keys.dart';
@immutable
class DBKeys{
  const DBKeys._();
  static String dbName='task.db';
  static String dbTable ='tasks';

  static const String idColumn=TaskKeys.id;
  static const String titleColumn=TaskKeys.title;
  static const String noteColumn=TaskKeys.note;
  static const String timeColumn=TaskKeys.time;
  static const String dateColumn=TaskKeys.date;
  static const String categoryColumn=TaskKeys.category;
  static const String isCompletedColumn=TaskKeys.isCompleted;

}