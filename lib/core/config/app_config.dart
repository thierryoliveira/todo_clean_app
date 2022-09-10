import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/injections/inject.dart';

import '../injections/firebase_initialize.dart';

class AppConfig {
  AppConfig._();
  static Future<void> setupAppConfigs() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FirebaseInitalize.init();
    await Inject.init();
  }
}
