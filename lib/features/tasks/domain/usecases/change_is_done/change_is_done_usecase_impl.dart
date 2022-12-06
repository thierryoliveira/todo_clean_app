import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/features/tasks/domain/repositories/task_repository.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/change_is_done/change_is_done_usecase.dart';

class ChangeIsDoneUsecaseImpl implements ChangeIsDoneUsecase {
  final TaskRepository _taskRepository;
  ChangeIsDoneUsecaseImpl({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;
  @override
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity}) =>
      _taskRepository.changeIsDone(taskEntity: taskEntity);
}
