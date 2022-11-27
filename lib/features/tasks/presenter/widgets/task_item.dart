import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/theme/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: CustomColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: Checkbox(
        value: false,
        onChanged: (_) {},
      ),
      title: const Text('task title'),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: CustomColors.red,
        ),
        onPressed: () {},
      ),
    );
  }
}
