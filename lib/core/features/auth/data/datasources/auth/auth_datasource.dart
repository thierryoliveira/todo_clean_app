import 'package:todo_clean_solid/core/features/auth/data/models/sign_in_model.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/sign_up_model.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/user_model.dart';

abstract class AuthDatasource {
  Future<UserModel> signIn({required SignInModel credentials});
  Future<UserModel> signUp({required SignUpModel signUpModel});
}
