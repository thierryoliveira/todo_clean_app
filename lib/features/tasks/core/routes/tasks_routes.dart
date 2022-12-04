import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/injections/inject.dart';
import 'package:todo_clean_solid/features/tasks/core/routes/tasks_named_routes.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/create_task/create_task_usecase.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/add_task_field/add_task_field_cubit.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/task/task_cubit.dart';

import '../../presenter/pages/task_list_page.dart';

class TasksRoutes {
  TasksRoutes._();

  static Map<String, Widget Function(BuildContext context)> routes(
          BuildContext context) =>
      {
        TasksNamedRoutes.taskList: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<AddTaskFieldCubit>(
                  create: (context) => AddTaskFieldCubit(),
                ),
                BlocProvider<TaskCubit>(
                  create: (context) => TaskCubit(
                    createTaskUsecase: getIt.get<CreateTaskUsecase>(),
                    getAllTasksUsecase: getIt.get<GetAllTasksUsecase>(),
                  ),
                ),
              ],
              child: const TaskListPage(),
            )
      };
}
