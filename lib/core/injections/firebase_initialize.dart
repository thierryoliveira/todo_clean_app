import 'package:firebase_core/firebase_core.dart';
import 'package:todo_clean_solid/firebase_options.dart';

class FirebaseInitalize {
  FirebaseInitalize._();

  static Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
