import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_up_entity.dart';

import '../../../../../errors/failures/failure.dart';
import '../../../data/models/user_model.dart';

abstract class SignUpUsecase {
  Future<Either<Failure, UserModel>> call({required SignUpEntity signUpEntity});
}
