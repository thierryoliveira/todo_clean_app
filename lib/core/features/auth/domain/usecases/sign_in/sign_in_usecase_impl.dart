import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_in_entity.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/user_entity.dart';
import 'package:todo_clean_solid/core/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_clean_solid/core/features/auth/domain/usecases/sign_in/sign_in_usecase.dart';

class SignInUsecaseImpl implements SignInUsecase {
  final AuthRepository _authRepository;

  SignInUsecaseImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, UserEntity>> call(
          {required SignInEntity signInEntity}) async =>
      await _authRepository.signIn(signInEntity: signInEntity);
}
