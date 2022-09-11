import 'package:flutter/material.dart';
import 'package:todo_clean_solid/features/tasks/core/routes/tasks_named_routes.dart';

import '../../presenter/pages/task_list_page.dart';

class TasksRoutes {
  TasksRoutes._();

  static Map<String, Widget Function(BuildContext context)> routes(
          BuildContext context) =>
      {TasksNamedRoutes.taskList: (context) => const TaskListPage()};
}
