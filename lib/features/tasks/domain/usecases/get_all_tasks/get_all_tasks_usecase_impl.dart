import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/features/tasks/domain/repositories/task_repository.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';

class GetAllTasksUsecaseImpl implements GetAllTasksUsecase {
  final TaskRepository _taskRepository;
  GetAllTasksUsecaseImpl({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  @override
  Future<Either<Failure, List<TaskEntity>>> call() =>
      _taskRepository.getAllTasks();
}
