import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_up_entity.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/user_model.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_clean_solid/core/features/auth/domain/usecases/sign_up/sign_up_usecase.dart';

class SignUpUsecaseImpl implements SignUpUsecase {
  final AuthRepository _authRepository;
  SignUpUsecaseImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, UserModel>> call(
          {required SignUpEntity signUpEntity}) async =>
      await _authRepository.signUp(signUpEntity: signUpEntity);
}
