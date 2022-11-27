import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/injections/inject.dart';
import 'package:todo_clean_solid/features/tasks/core/routes/tasks_named_routes.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/add_task_field/add_task_field_cubit.dart';

import '../../presenter/pages/task_list_page.dart';

class TasksRoutes {
  TasksRoutes._();

  static Map<String, Widget Function(BuildContext context)> routes(
          BuildContext context) =>
      {
        TasksNamedRoutes.taskList: (context) => BlocProvider<AddTaskFieldCubit>(
              create: (context) => getIt.get<AddTaskFieldCubit>(),
              child: const TaskListPage(),
            )
      };
}
