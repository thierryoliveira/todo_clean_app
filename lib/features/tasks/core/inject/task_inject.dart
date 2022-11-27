import 'package:todo_clean_solid/core/injections/inject.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/add_task_field/add_task_field_cubit.dart';

class TaskInject {
  TaskInject._();
  static void inject() {
    getIt.registerFactory<AddTaskFieldCubit>(() => AddTaskFieldCubit());
  }
}
