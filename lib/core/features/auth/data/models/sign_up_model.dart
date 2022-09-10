import 'package:todo_clean_solid/core/features/auth/domain/entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  const SignUpModel(
      {required super.name, required super.email, required super.password});

  factory SignUpModel.fromEntity(SignUpEntity signUpEntity) => SignUpModel(
      name: signUpEntity.name,
      email: signUpEntity.email,
      password: signUpEntity.password);
}
