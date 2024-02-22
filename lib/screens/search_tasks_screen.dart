
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


class SearchTasksScreen extends ConsumerWidget {
  static SearchTasksScreen builder(BuildContext context,GoRouterState state)=> const SearchTasksScreen();

  const SearchTasksScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final colors= context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    String searchValue = ref.watch(searchProvider);
    // final allTask =_allTasks(taskState.tasks,searchValue);

    final today = DateFormat.yMMMd().format(DateTime.now());
    return Scaffold(
      
      body:Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height*0.4,
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
                      const DisplayWhiteText(text:'Todo App Search',
                        fontSize: 40,
                         ),
                         const Gap(10),
                Container(
                  height: deviceSize.height*0.1,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                color: colors.background,
                borderRadius:  BorderRadius.circular(20
,
              ),
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search tasks',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
              onChanged: (value){
                ref.read(searchProvider.notifier).state=value; 
                
              },
            
            ),
          ),
                      
                     
                    ],
                    
                  ),
                  
              
              ),
              
             
            ],
          ),
          
         
           Positioned(
            top :220,
            left: 0,
            right: 0,

                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                       DisplaySearchResult(
                        tasks: _allTasks(taskState.tasks,searchValue),
                        isCompletedTasks: false,
                         
                        
                     
                      ),
                   
                      const Gap(20),


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
  List<Task> _allTasks(List<Task> tasks,String value){

    final List<Task> filteredTask = [];
    if(value.isEmpty){
      return tasks;
    }
    for(var task in tasks){
      
      if(Helpers.isContains(task, value)){
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