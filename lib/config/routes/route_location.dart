

import 'package:flutter/material.dart';
@immutable
class RouteLocation{
  const RouteLocation._();
  static String get home => '/home';
  static String get createTask => '/createTask';
  static String get todayTasks => '/todayTasks';
  static String get upcomingTasks => '/upcomingTasks';
  static String get searchTasks => '/searchTasks';
}