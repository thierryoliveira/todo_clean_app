import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/cubit/auth_cubit.dart';
import 'package:todo_clean_solid/core/validators/validators.dart';
import 'package:todo_clean_solid/core/widgets/custom_password_textfield.dart';
import 'package:todo_clean_solid/features/tasks/core/routes/tasks_named_routes.dart';
import '../../../../extensions/build_context.dart';
import '../../../../routes/auth_named_routes.dart';
import '../../../../theme/colors.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/sized_box_spacer.dart';

import '../../../../theme/text_styles.dart';
import '../widgets/auth_header_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  late AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, TasksNamedRoutes.taskList);
        return;
      }
    });

    _authCubit = context.read<AuthCubit>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * .05, vertical: context.height * .04),
          child: Form(
            key: _formKey,
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is SignInSuccess) {
                  Navigator.pushNamed(context, TasksNamedRoutes.taskList);
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.messsage),
                    backgroundColor: CustomColors.red,
                  ));
                }
              },
              child: CustomScrollView(slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBoxSpacer(
                      percentage: 5,
                    ),
                    const AuthHeaderWidget(
                        title: 'Bem vindo!', subtitle: 'Entre para continuar'),
                    const SizedBoxSpacer(
                      percentage: 8,
                    ),
                    CustomTextfield(
                      validator: CustomValidators.multiple([
                        CustomValidators.isRequired(),
                        CustomValidators.isValidEmail()
                      ]),
                      controller: _emailController,
                      labelText: 'Email',
                    ),
                    const SizedBoxSpacer(
                      percentage: 2,
                    ),
                    CustomPasswordTextfield(
                      validator: CustomValidators.isRequired(),
                      controller: _passwordController,
                      labelText: 'Senha',
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyles.small
                                .copyWith(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ]),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) => SizedBox(
                                width: double.maxFinite,
                                child: CustomButton(
                                  isLoading: state is SignInLoading,
                                  text: 'Entrar',
                                  onPressed: () async {
                                    if (_formKey.currentState == null ||
                                        !_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    await _authCubit.signIn(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                  },
                                ),
                              )),
                      const SizedBoxSpacer(
                        percentage: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ainda não tem conta?',
                            style: TextStyles.small,
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, AuthNamedRoutes.authSignUp),
                            child: Text(
                              'Crie aqui',
                              style: TextStyles.small.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
}
