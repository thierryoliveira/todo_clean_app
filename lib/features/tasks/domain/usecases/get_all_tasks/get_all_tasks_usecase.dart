import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures/failure.dart';
import '../../entities/entities.dart';

abstract class GetAllTasksUsecase {
  Future<Either<Failure, List<TaskEntity>>> call();
}
