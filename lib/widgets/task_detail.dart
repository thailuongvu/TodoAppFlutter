
import 'package:first_flutter_project/data/data.dart';
import 'package:first_flutter_project/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/widgets.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key,required this.task});
  final Task task; 

  @override
  Widget build(BuildContext context) {
    final style =context.textTheme;
    return Padding(
    

      padding: const EdgeInsets.all(30.0),
      child: Column(
       
        children: [
          CircleContainer(color: task.category.color.withOpacity(0.3),
          child: Icon(task.category.icon,
           color: task.category.color,),
         
          ),
          const Gap(20),
          Text(task.title,
          style: style.titleMedium?.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),
          Text(task.time,
          style: style.titleMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          ),
          const Gap(20),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('task to be completed on ${task.date}'),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                )
              ],

          )),
          const Gap(20),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          Text(
            task.note.isEmpty? 'No note':task.note,),
          const Gap(20),
            Visibility(
            visible: task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task completed'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
              ],

          )),



        ],
      ),
      );
  }
}