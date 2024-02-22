
import 'dart:ui';

import 'package:first_flutter_project/providers/providers.dart';
import 'package:first_flutter_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';  

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final date =ref.watch(dateProvider);
    final time =ref.watch(timeProvider);
    
    return Row(
              children: [
                Expanded(
                  child: CommonTextField(title: DateFormat.yMMMd().format(date),
                   hintText: DateFormat.yMMMd().format(date),
                   readOnly:true,
                   suffixIcon: IconButton(onPressed: ()=>_selectDate(context,ref),
                    icon: const FaIcon(FontAwesomeIcons.calendar)
                    ),
                    ),
                  ),
                   const Gap(10),
                Expanded(
                  child: CommonTextField(title: Helpers.timeToString(time),
                    
                   hintText: Helpers.timeToString(time),
                   readOnly:true,
                   suffixIcon: IconButton(onPressed: ()=>_selectTime(context,ref),
                    icon: const FaIcon(FontAwesomeIcons.clock)
                    ),),
                   
                   )

              ],
            );
  }
  void _selectTime(BuildContext context,WidgetRef ref) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state=(pickedTime);
    }
  }
  void _selectDate(BuildContext context,WidgetRef ref) async {
    final initialDate= ref.watch(dateProvider);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2024, 2),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state=(pickedDate);
    }
  }
}