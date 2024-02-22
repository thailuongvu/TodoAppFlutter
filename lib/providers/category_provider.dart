import 'package:first_flutter_project/utils/task_categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final categoryProvider =StateProvider.autoDispose<TaskCategories>((ref) => TaskCategories.others);