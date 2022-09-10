import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_clean_solid/core/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.name,
  });

  factory UserModel.fromFirebase(User? firebaseUser) =>
      UserModel(name: firebaseUser?.displayName);
}
