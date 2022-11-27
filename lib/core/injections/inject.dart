import 'package:get_it/get_it.dart';
import 'package:todo_clean_solid/core/injections/auth_injection.dart';
import 'package:todo_clean_solid/core/injections/firebase_injection.dart';
import 'package:todo_clean_solid/features/tasks/core/inject/task_inject.dart';

final GetIt getIt = GetIt.instance;

class Inject {
  Inject._();
  static Future<void> init() async {
    FirebaseInjection().inject(getIt);
    AuthInjection().inject(getIt);
    TaskInject.inject();
  }
}
