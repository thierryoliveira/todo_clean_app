import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_up_entity.dart';

import '../../../../errors/failures/failure.dart';
import '../../data/models/user_model.dart';
import '../entities/sign_in_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signIn(
      {required SignInEntity signInEntity});

  Future<Either<Failure, UserModel>> signUp(
      {required SignUpEntity signUpEntity});
}
