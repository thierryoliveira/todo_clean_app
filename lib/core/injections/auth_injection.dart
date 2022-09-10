import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_clean_solid/core/features/auth/data/datasources/auth/auth_datasource.dart';
import 'package:todo_clean_solid/core/features/auth/data/datasources/auth/auth_datasource_impl.dart';
import 'package:todo_clean_solid/core/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:todo_clean_solid/core/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_clean_solid/core/features/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:todo_clean_solid/core/features/auth/domain/usecases/sign_in/sign_in_usecase_impl.dart';
import 'package:todo_clean_solid/core/features/auth/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:todo_clean_solid/core/features/auth/domain/usecases/sign_up/sign_up_usecase_impl.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/cubit/auth_cubit.dart';

class AuthInjection {
  void inject(GetIt getIt) {
    //! Datasources
    getIt.registerFactory<AuthDatasource>(
        () => AuthDatasourceImpl(firebaseAuth: getIt.get<FirebaseAuth>()));

    //! Repositories
    getIt.registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(authDatasource: getIt.get<AuthDatasource>()));

    //! Usecases
    getIt.registerFactory<SignInUsecase>(
        () => SignInUsecaseImpl(authRepository: getIt.get<AuthRepository>()));
    getIt.registerFactory<SignUpUsecase>(
        () => SignUpUsecaseImpl(authRepository: getIt.get<AuthRepository>()));

    //! Cubits
    getIt.registerFactory<AuthCubit>(() => AuthCubit(
        signInUsecase: getIt.get<SignInUsecase>(),
        signUpUsecase: getIt.get<SignUpUsecase>()));
  }
}
