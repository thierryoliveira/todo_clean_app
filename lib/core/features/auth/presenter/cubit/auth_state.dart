part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignInSuccess extends AuthState {
  final UserEntity userEntity;

  const SignInSuccess({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

class SignUpSuccess extends AuthState {
  final UserEntity userEntity;

  const SignUpSuccess({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

class AuthError extends AuthState {
  final String messsage;

  const AuthError({required this.messsage});

  @override
  List<Object> get props => [messsage];
}

class SignInLoading extends AuthState {}

class SignUpLoading extends AuthState {}
