import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/config/app_config.dart';
import 'package:todo_clean_solid/core/routes/app_routes.dart';
import 'package:todo_clean_solid/core/routes/auth_named_routes.dart';
import 'package:todo_clean_solid/core/theme/app_theme.dart';

void main() async {
  await AppConfig.setupAppConfigs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      initialRoute: AuthNamedRoutes.authSignIn,
      routes: AppRoutes.routes(context),
    );
  }
}
