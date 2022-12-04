import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/features/tasks/domain/repositories/task_repository.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/create_task/create_task_usecase.dart';

class CreateTaskUsecaseImpl implements CreateTaskUsecase {
  final TaskRepository _taskRepository;

  CreateTaskUsecaseImpl({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  @override
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity}) =>
      _taskRepository.createTask(taskEntity: taskEntity);
}
