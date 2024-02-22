
import 'package:first_flutter_project/config/routes/routes.dart';
import 'package:first_flutter_project/data/data.dart';
import 'package:first_flutter_project/providers/providers.dart';

import 'package:first_flutter_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import'../utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';


class TodayTasksScreen extends ConsumerWidget {
  static TodayTasksScreen builder(BuildContext context,GoRouterState state)=> const TodayTasksScreen();

  const TodayTasksScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final colors= context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTask =_completedTasks(taskState.tasks);
    final inCompletedTask =_inCompletedTasks(taskState.tasks);
    final today = DateFormat.yMMMd().format(DateTime.now());
    return Scaffold(
      
      body:Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height*0.2,
                width: deviceSize.width,
                color:colors.primary,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(10),
                      DisplayWhiteText(text: today,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,),
                      
                      const Gap(10),
                      const DisplayWhiteText(text:'Todo App Today',
                        fontSize: 40,
                         ),
                      
                     
                    ],
                    
                  ),
                  
              
              ),
              
             
            ],
          ),
           Positioned(
            top :90,
            left: 0,
            right: 0,

                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                       DisplayListOfTasks(
                        tasks: inCompletedTask,
                        isCompletedTasks: false,
                         
                        
                      
                     
                      ),
                   
                      const Gap(20),
                      const Text("Complete",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      
                      ),
                     DisplayListOfTasks(
                        tasks: completedTask,
                        isCompletedTasks: true,
                     
                      ),
                      const Gap(20),
                      ElevatedButton(
                        onPressed: ()=>context.pop(),
                        child: const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: DisplayWhiteText(text: 'Back'),
                        ),
                        
                      ),
                  
                  
                    ],
                  
                      ),
                  ),
                ),
                ),
          
        ],
      ),

);
  }
  List<Task> _completedTasks(List<Task> tasks){
    final List<Task> filteredTask = [];
    for(var task in tasks){
      
      if(task.isCompleted ){
        
        filteredTask.add(task);
      }

    }
    return filteredTask;
  } 

  List<Task> _inCompletedTasks(List<Task> tasks){
    final List<Task> filteredTask = [];
    for(var task in tasks){
      final isTaskToday =Helpers.isTaskToDay(task);
      if(!task.isCompleted&& isTaskToday){
        filteredTask.add(task);
      }

    }
    return filteredTask;
  } 
}