import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/features/tasks/domain/repositories/task_repository.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/delete_task/delete_task_usecase.dart';

import '../../../../../core/errors/failures/failure.dart';

class DeleteTaskUsecaseImpl implements DeleteTaskUsecase {
  final TaskRepository _taskRepository;

  DeleteTaskUsecaseImpl({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  @override
  Future<Either<Failure, bool>> call({required String taskId}) =>
      _taskRepository.deleteTask(taskId: taskId);
}
