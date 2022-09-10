import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  const UserEntity({
    this.name,
  });

  @override
  List<Object?> get props => [name];
}
