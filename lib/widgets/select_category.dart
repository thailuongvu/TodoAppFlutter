
import 'package:first_flutter_project/providers/providers.dart';
import 'package:first_flutter_project/utils/utils.dart';
import 'package:first_flutter_project/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedCategory =ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children:[
          Text('Category',
          style: context.textTheme.titleLarge,),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx,index){
              final category = categories[index];
              return InkWell(
                onTap: (){
                  ref.read(categoryProvider.notifier).state=category;
                
                },
                borderRadius: BorderRadius.circular(30),
                child: CircleContainer(
                color: category.color,
              child:Icon(category.icon,
              color: category == selectedCategory? 
              context.colorScheme.primary :category.color,)),
              );
            },
           separatorBuilder: (ctx,index)=>const Gap(8),
            
            itemCount: categories.length,) ,
          )
        ]
      )

    );
  }
}