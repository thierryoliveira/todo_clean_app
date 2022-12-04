import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_clean_solid/core/injections/inject.dart';
import 'package:todo_clean_solid/features/tasks/data/datasources/datasources.dart';
import 'package:todo_clean_solid/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:todo_clean_solid/features/tasks/domain/repositories/task_repository.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/create_task/create_task_usecase.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/create_task/create_task_usecase_impl.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/get_all_tasks/get_all_tasks_usecase_impl.dart';

class TaskInject {
  TaskInject._();
  static void inject() {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    getIt.registerFactory<TaskDatasource>(
        () => TaskDatasourceImpl(database: getIt.get<FirebaseFirestore>()));

    getIt.registerFactory<TaskRepository>(
        () => TaskRepositoryImpl(taskDatasource: getIt.get<TaskDatasource>()));

    getIt.registerFactory<CreateTaskUsecase>(() =>
        CreateTaskUsecaseImpl(taskRepository: getIt.get<TaskRepository>()));

    getIt.registerFactory<GetAllTasksUsecase>(() =>
        GetAllTasksUsecaseImpl(taskRepository: getIt.get<TaskRepository>()));
  }
}
