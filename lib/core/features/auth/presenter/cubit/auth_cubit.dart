import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_in_entity.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_up_entity.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/user_entity.dart';
import 'package:todo_clean_solid/core/features/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:todo_clean_solid/core/features/auth/domain/usecases/sign_up/sign_up_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUsecase _signInUsecase;
  final SignUpUsecase _signUpUsecase;

  AuthCubit(
      {required SignInUsecase signInUsecase,
      required SignUpUsecase signUpUsecase})
      : _signInUsecase = signInUsecase,
        _signUpUsecase = signUpUsecase,
        super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    final either = await _signInUsecase(
        signInEntity: SignInEntity(email: email, password: password));

    either.fold((failure) => emit(AuthError(messsage: failure.message)),
        (userEntity) => emit(SignInSuccess(userEntity: userEntity)));
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    final either = await _signUpUsecase(
        signUpEntity:
            SignUpEntity(email: email, password: password, name: name));
    either.fold((failure) => emit(AuthError(messsage: failure.message)),
        (userEntity) => SignUpSuccess(userEntity: userEntity));
  }
}
