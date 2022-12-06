import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures/failure.dart';

abstract class DeleteTaskUsecase {
  Future<Either<Failure, bool>> call({required String taskId});
}
