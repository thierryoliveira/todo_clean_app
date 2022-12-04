import 'package:flutter/material.dart';
import 'package:todo_clean_solid/features/tasks/domain/entities/enums/create_task_button_type.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onTap;
  final CreateTaskButtonType createTaskButtonType;
  const AddTaskButton(
      {super.key, required this.createTaskButtonType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: createTaskButtonType.color,
      onPressed: onTap,
      child: Icon(createTaskButtonType.iconData),
    );
  }
}
