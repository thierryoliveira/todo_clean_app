import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class FirebaseInjection {
  // FirebaseInjection._();

  void inject(GetIt getIt) {
    getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
  }
}
