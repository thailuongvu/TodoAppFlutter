
import 'package:first_flutter_project/data/data.dart';
import 'package:first_flutter_project/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/widgets.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.task, this.onCompleted});
  final Task  task;
  final Function(bool?)? onCompleted;



  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final double iconOpacity = task.isCompleted? 0.3:0.5;
    final backgroundOpacity = task.isCompleted? 0.1:0.3;
    final textDecoration = task.isCompleted? TextDecoration.lineThrough:TextDecoration.none;
    final decorationThickness = task.isCompleted? 3.0:0.0;
    return Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 10,
                              bottom: 10,
                            
                            ),
                            child: Row(
                              children: [
                                CircleContainer(
                                  color:  task.category.color.withOpacity(backgroundOpacity),
                                  child: Center(
                                    child: Icon(
                                      task.category.icon,
                                      color: task.category.color.withOpacity(iconOpacity),
                                      
                                      
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(task.title,
                                      style: style.titleMedium?.copyWith(
                                    
                                        decoration: textDecoration,
                                        decorationThickness: decorationThickness,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      Text(task.time
                                      ,style: style.titleMedium?.copyWith(
                                        decoration: textDecoration,
                                         decorationThickness: decorationThickness,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                                Checkbox(value: task.isCompleted, onChanged: onCompleted)  
                            
                              ],
                            ),
                          );
  }
}