import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/injections/inject.dart';
import 'package:todo_clean_solid/features/tasks/core/routes/tasks_named_routes.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/change_is_done/change_is_done_usecase.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/create_task/create_task_usecase.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/add_task_field/add_task_field_cubit.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/task/task_cubit.dart';

import '../../domain/usecases/delete_task/delete_task_usecase.dart';
import '../../domain/usecases/generate_random_id/generate_random_id_usecase.dart';
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
                      changeIsDoneUsecase: getIt.get<ChangeIsDoneUsecase>(),
                      createTaskUsecase: getIt.get<CreateTaskUsecase>(),
                      getAllTasksUsecase: getIt.get<GetAllTasksUsecase>(),
                      generateRandomIdUsecase:
                          getIt.get<GenerateRandomIdUsecase>(),
                      deleteTaskUsecase: getIt.get<DeleteTaskUsecase>()),
                ),
              ],
              child: const TaskListPage(),
            )
      };
}
