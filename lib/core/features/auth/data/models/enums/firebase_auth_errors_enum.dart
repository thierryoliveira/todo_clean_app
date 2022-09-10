enum FirebaseAuthErrorsEnum {
  weakPassword(code: 'weak-password'),
  emailAlreadyInUse(code: 'email-already-in-use');

  final String code;
  const FirebaseAuthErrorsEnum({required this.code});
}
