
import 'package:first_flutter_project/data/data.dart';
import 'package:first_flutter_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../providers/providers.dart';
import'../utils/utils.dart';
import 'common_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplaySearchResult extends ConsumerWidget {
  const DisplaySearchResult({super.key, required this.tasks, required this.isCompletedTasks});
  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final emptyMessage = isCompletedTasks? "No completed tasks yet":"No tasks yet";
    return CommonContainer(
                      height: deviceSize.height*0.5,
                      child: tasks.isEmpty? Center(
                        child: Text(emptyMessage,
                        style: TextStyle(
                          color: context.colorScheme.onSurface,
                          fontSize: 20,
                        ),
                        ),
                      ):
                       ListView.separated(
                        shrinkWrap: true,
                        padding:  EdgeInsets.zero,
                        itemCount: tasks.length,
                        itemBuilder: (ctx,index){
                          final task = tasks[index];
                          return InkWell(
                            onLongPress: (){
                              AppAlerts.showDeleteAlertDialog(context, ref, task);
                            },
                            onTap:() async{
                              await showBottomSheet(context: context,
                               builder: (ctx){
                                    return TaskDetail(task:task);
                               });
                              
                            },
                            child: TaskTitle
                            (task:task,
                            onCompleted: (value)async{
                              await ref.read(taskProvider.notifier)
                                        .updateTask(task).then(
                                          (value){
                                            AppAlerts.displaySnackBar(context,
                                            task.isCompleted? 'Task incompleted':'Task completed');
                                          }
                                        );
                            },
                            ),
                          );
                          
                          
                        }, separatorBuilder: (BuildContext context, int index) {
                          return const Divider(thickness: 1.5,);
                          },
                      ),
                  
                    );
  }
}