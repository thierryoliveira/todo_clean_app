import 'package:flutter/material.dart';

import 'package:todo_clean_solid/core/theme/colors.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDone;

  const TaskItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: CustomColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: Checkbox(
        value: false,
        onChanged: (_) {},
      ),
      title: Text(title),
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
