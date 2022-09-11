import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/routes/auth_routes.dart';
import 'package:todo_clean_solid/features/tasks/core/routes/tasks_routes.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routes(
    BuildContext context,
  ) =>
      {...AuthRoutes.routes(context), ...TasksRoutes.routes(context)};
}
