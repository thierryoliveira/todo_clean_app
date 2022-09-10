import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/cubit/auth_cubit.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/pages/signin_page.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/pages/signup_page.dart';
import 'package:todo_clean_solid/core/injections/inject.dart';
import 'package:todo_clean_solid/core/routes/auth_named_routes.dart';

class AuthRoutes {
  AuthRoutes._();

  static Map<String, Widget Function(BuildContext context)> routes(
          BuildContext context) =>
      {
        AuthNamedRoutes.authSignIn: (context) => BlocProvider<AuthCubit>(
              create: (context) => getIt.get<AuthCubit>(),
              child: const SignInPage(),
            ),
        AuthNamedRoutes.authSignUp: (context) => BlocProvider<AuthCubit>(
              create: (context) => getIt.get<AuthCubit>(),
              child: const SignUpPage(),
            ),
      };
}
