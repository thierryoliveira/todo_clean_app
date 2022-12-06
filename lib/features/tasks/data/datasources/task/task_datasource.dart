import 'package:todo_clean_solid/features/tasks/data/models/task_model.dart';

abstract class TaskDatasource {
  Future<bool> createTask({required TaskModel taskModel});
  Future<List<TaskModel>> getAllTasks();
  Future<bool> deleteTask({required String taskId});
  Future<bool> changeIsDone({required TaskModel taskModel});
}
