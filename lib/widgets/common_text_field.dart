
import 'package:first_flutter_project/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({super.key, required this.title,
   required this.hintText,  this.controller,
    this.maxLines, this.suffixIcon,  this.readOnly=false});
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch ,
      children: [
        Text(title,
        style: context.textTheme.titleLarge,),
        const Gap(10),
            TextField(
              controller: controller,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              maxLines: maxLines,
              decoration:  InputDecoration(
                labelText: title,
                hintText: hintText,
                suffixIcon: suffixIcon,
              ),
              onChanged: (value){},
            ),

      ],
    );
  }
}