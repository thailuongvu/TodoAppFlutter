import 'package:first_flutter_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/task.dart';
import 'package:go_router/go_router.dart';

import '../providers/providers.dart';

class AppAlerts{
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message){
    
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,
      style:context.textTheme.bodyLarge?.copyWith(
        color: context.colorScheme.surface
      ),
      ),
      backgroundColor: context.colorScheme.primary,

      duration: const Duration(seconds: 3),
    ),
    );
  }
  static Future<void> showDeleteAlertDialog( BuildContext context ,
    WidgetRef ref,Task task) async{
      Widget cancelButton = TextButton(
        child: const Text('No'),
        onPressed: ()=>
          context.pop()
        ,
      );
      Widget deleteButton = TextButton(
        child: const Text('Yes'),
        onPressed: () async {
         await ref.read(taskProvider.notifier).deleteTask(task).
         then((value) {
          AppAlerts.displaySnackBar(context, 'Task deleted successfully');
          context.pop();
         });
       
        },
      );
      AlertDialog alert = AlertDialog(
        title: const Text('Are you sure you want to delete this task?'),

        actions: [
          cancelButton,
          deleteButton,
        ],
      );
      await showDialog(
        context: context,
        builder: (ctx) {
          return alert;
        },
      );


  }
}