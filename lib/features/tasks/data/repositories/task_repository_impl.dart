import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:todo_clean_solid/core/errors/failures/task_failure.dart';
import 'package:todo_clean_solid/features/tasks/core/errors/exceptions/task_exception.dart';
import 'package:todo_clean_solid/features/tasks/data/datasources/datasources.dart';
import 'package:todo_clean_solid/features/tasks/data/models/task_model.dart';
import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_clean_solid/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource _taskDatasource;
  TaskRepositoryImpl({
    required TaskDatasource taskDatasource,
  }) : _taskDatasource = taskDatasource;

  @override
  Future<Either<Failure, bool>> createTask(
      {required TaskEntity taskEntity}) async {
    try {
      final result = await _taskDatasource.createTask(
          taskModel: TaskModel.fromEntity(taskEntity));
      return Right(result);
    } on TaskException catch (exception) {
      return Left(TaskFailure(message: exception.errorMessage));
    }
  }
}
