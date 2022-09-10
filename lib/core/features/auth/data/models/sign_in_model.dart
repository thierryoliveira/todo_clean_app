import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  const SignInModel({required super.email, required super.password});

  factory SignInModel.fromEntity(SignInEntity signInEntity) =>
      SignInModel(email: signInEntity.email, password: signInEntity.password);
}
