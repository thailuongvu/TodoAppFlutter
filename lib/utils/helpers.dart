
import 'package:first_flutter_project/data/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Helpers{
  Helpers._();
  static String timeToString(TimeOfDay time){
   try{
    final DateTime now = DateTime.now();
    final DateTime date = DateTime(now.year, now.month, now.day, time.hour, time.minute);
     return DateFormat.jm().format(date);
  }
  catch(e){
    return '00:00';
      }
  }
  static bool isTaskToDay(Task task){
    final DateTime taskDate = _stringToDateTime(task.date);
    final DateTime now = DateTime.now();
    //today
    if(taskDate.year==now.year && taskDate.month==now.month && taskDate.day==now.day){
      return true;
    }
    return false;
  }

    static bool isTaskUpcoming(Task task){
    final DateTime taskDate = _stringToDateTime(task.date);
    final DateTime now = DateTime.now();

    //upcoming
    if(taskDate.isAfter(now)){
      return true;
    }
    return false;
  }
  static bool isContains(Task task,String value){
    if(task.title.toLowerCase().contains(value.toLowerCase())){
      return true;
    }
    return false;
  }

  static DateTime _stringToDateTime(String date){
    return DateFormat.yMMMd().parse(date);
  } 
}