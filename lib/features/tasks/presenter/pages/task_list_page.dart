import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/extensions/build_context.dart';
import 'package:todo_clean_solid/core/theme/text_styles.dart';
import 'package:todo_clean_solid/features/tasks/presenter/pages/add_task_field.dart';
import 'package:todo_clean_solid/features/tasks/presenter/widgets/task_item.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButton: const AddTaskField(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .05),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: context.height * .06, bottom: context.height * .04),
              child: Text(
                'What will you like to do?',
                style: TextStyles.header1,
              ),
            ),
            const TaskItem(),
            const SizedBox(height: 50),
          ],
        ),
      ));
}
