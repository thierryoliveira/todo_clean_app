import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/theme/text_styles.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Text(
          'Task list page',
          style: TextStyles.header3,
        ),
      );
}
