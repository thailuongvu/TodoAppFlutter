import 'package:first_flutter_project/config/config.dart';
import 'package:first_flutter_project/config/routes/routes_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final routeConfig= ref.watch(routesProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: AppTheme.light,
      routerConfig: routeConfig,
    );
  }
}

