import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/theme/colors.dart';

enum CreateTaskButtonType {
  add(iconData: Icons.add, color: CustomColors.blue),
  done(iconData: Icons.check, color: CustomColors.green),
  cancel(iconData: Icons.cancel, color: CustomColors.grey);

  final IconData iconData;
  final Color color;

  const CreateTaskButtonType({required this.iconData, required this.color});
}
