import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, bool>> createTask({required TaskEntity taskEntity});
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
  Future<Either<Failure, bool>> deleteTask({required String taskId});
  Future<Either<Failure, bool>> changeIsDone({required TaskEntity taskEntity});
}
