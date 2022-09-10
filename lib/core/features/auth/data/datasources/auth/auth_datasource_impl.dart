import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_clean_solid/core/errors/exceptions/auth_exception.dart';
import 'package:todo_clean_solid/core/features/auth/data/datasources/auth/auth_datasource.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/enums/firebase_auth_errors_enum.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/sign_in_model.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/sign_up_model.dart';
import 'package:todo_clean_solid/core/features/auth/data/models/user_model.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth _firebaseAuth;

  const AuthDatasourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<UserModel> signIn({required SignInModel credentials}) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      return UserModel.fromFirebase(response.user);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? e.code);
    } catch (e) {
      throw AuthException(message: 'Something went wrong on sign in');
    }
  }

  @override
  Future<UserModel> signUp({required SignUpModel signUpModel}) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: signUpModel.email, password: signUpModel.password);
      final user = response.user;
      await user!.updateDisplayName(signUpModel.name);
      await user.reload();
      return UserModel.fromFirebase(_firebaseAuth.currentUser);
    } on FirebaseAuthException catch (e) {
      String? message;
      if (e.code == FirebaseAuthErrorsEnum.weakPassword.code) {
        message = 'The password is too weak';
      } else if (e.code == FirebaseAuthErrorsEnum.emailAlreadyInUse.code) {
        message = 'The email is already in use';
      }
      throw AuthException(message: message ?? e.message ?? e.code);
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}
