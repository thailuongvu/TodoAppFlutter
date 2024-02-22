
import 'package:first_flutter_project/config/routes/routes.dart';
import 'package:first_flutter_project/data/models/task.dart';
import 'package:first_flutter_project/providers/providers.dart';
import 'package:first_flutter_project/utils/utils.dart';
import 'package:first_flutter_project/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:first_flutter_project/utils/utils.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context,GoRouterState state)=>
   const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text:'Create Task'),
      ),
      body:  SingleChildScrollView(
        physics:  const AlwaysScrollableScrollPhysics(),
        padding:  const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             CommonTextField(
              title: 'Task Title',
              hintText: 'Enter Task Title',
              controller: _titleController,),
            const Gap(16),
            const SelectCategory(),
            const Gap(16),
             const SelectDateTime(),
            const Gap(16),
             CommonTextField(title: 'Task Note',
              hintText: 'Enter Task Note',
              maxLines: 6,
              controller: _noteController,),
              const Gap(60),

            ElevatedButton(onPressed: ()=>_createTask(),
             child: const DisplayWhiteText(text: 'Save')),
            
           
           
          ],
        ),

      )
    );
  }
  void _createTask() async{
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if(title.isNotEmpty){
      final  task = Task(
        title: title,
        note: note,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        category: category,
        isCompleted: false,
      );
      await ref.read(taskProvider.notifier).createTask(task).
      then((value) {
        AppAlerts.displaySnackBar(context,'Task Create Successfull');
        context.go(RouteLocation.home);
      });
     
    }else{
      AppAlerts.displaySnackBar(context,'Task Title cannot be empty');
    }
  }
}