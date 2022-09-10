import 'package:todo_clean_solid/core/errors/exceptions/auth_exception.dart';
import 'package:todo_clean_solid/core/errors/failures/auth_failure.dart';
import 'package:todo_clean_solid/core/features/auth/data/datasources/auth/auth_datasource.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/sign_in_model.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/sign_up_model.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_in_entity.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/user_model.dart';
import 'package:todo_clean_solid/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_up_entity.dart';
import 'package:todo_clean_solid/core/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;
  AuthRepositoryImpl({required AuthDatasource authDatasource})
      : _authDatasource = authDatasource;

  @override
  Future<Either<Failure, UserModel>> signIn(
      {required SignInEntity signInEntity}) async {
    try {
      final result = await _authDatasource.signIn(
          credentials: SignInModel.fromEntity(signInEntity));
      return Right(result);
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(
      {required SignUpEntity signUpEntity}) async {
    try {
      final result = await _authDatasource.signUp(
          signUpModel: SignUpModel.fromEntity(signUpEntity));
      return Right(result);
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }
}
