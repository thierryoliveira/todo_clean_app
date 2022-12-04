import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';

abstract class CreateTaskUsecase {
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity});
}
