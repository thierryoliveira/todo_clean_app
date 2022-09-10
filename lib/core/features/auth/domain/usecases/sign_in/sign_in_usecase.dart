import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_in_entity.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/user_entity.dart';

abstract class SignInUsecase {
  Future<Either<Failure, UserEntity>> call(
      {required SignInEntity signInEntity});
}
