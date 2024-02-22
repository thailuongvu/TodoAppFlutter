import 'package:first_flutter_project/config/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_project/screens/screens.dart';
final navigationKey = GlobalKey<NavigatorState>();
final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
      
    
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
     builder: CreateTaskScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.todayTasks,
    parentNavigatorKey: navigationKey,
    builder: TodayTasksScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.upcomingTasks,
    parentNavigatorKey: navigationKey,
    builder: UpcomingTasksScreen.builder,
  ),
    GoRoute(
    path: RouteLocation.searchTasks,
    parentNavigatorKey: navigationKey,
    builder: SearchTasksScreen.builder,
  ),


];