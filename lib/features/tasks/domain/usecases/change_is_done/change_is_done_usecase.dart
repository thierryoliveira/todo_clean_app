import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/features/tasks/domain/entities/entities.dart';

import '../../../../../core/errors/failures/failure.dart';

abstract class ChangeIsDoneUsecase {
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity});
}
