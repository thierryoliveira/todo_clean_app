import 'package:flutter/material.dart';

import 'package:todo_clean_solid/core/theme/colors.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onDelete;
  final VoidCallback onChangeIsDone;

  const TaskItem({
    Key? key,
    required this.title,
    required this.isDone,
    required this.onDelete,
    required this.onChangeIsDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: CustomColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: Checkbox(
        value: isDone,
        onChanged: (_) {
          onChangeIsDone();
        },
      ),
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: CustomColors.red,
        ),
        onPressed: onDelete,
      ),
    );
  }
}
