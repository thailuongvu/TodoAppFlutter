
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum TaskCategories{
  education(Icons.school,Colors.blueGrey),
  health(Icons.favorite,Colors.red),
  home(Icons.home,Colors.green),
  others(Icons.person,Colors.blue);
  static TaskCategories stringToCategory(String name){
    try{
      return TaskCategories.values.firstWhere((category)=>category.name==name,);
    }
    catch(e){
      return TaskCategories.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategories( this.icon, this.color);
}