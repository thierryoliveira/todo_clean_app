import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/cubit/auth_cubit.dart';
import 'package:todo_clean_solid/core/routes/auth_named_routes.dart';
import 'package:todo_clean_solid/features/tasks/core/routes/tasks_named_routes.dart';
import '../../../../enums/custom_button_type.dart';
import '../../../../extensions/build_context.dart';
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
          padding: EdgeInsets.symmetric(horizontal: context.width * .05),
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
              child: ListView(
                children: [
                  const SizedBoxSpacer(
                    percentage: 5,
                  ),
                  const AuthHeaderWidget(
                      title: 'Bem vindo!', subtitle: 'Entre para continuar'),
                  const SizedBoxSpacer(
                    percentage: 8,
                  ),
                  CustomTextfield(
                    controller: _emailController,
                    labelText: 'Email',
                  ),
                  const SizedBoxSpacer(
                    percentage: 2,
                  ),
                  CustomTextfield(
                    controller: _passwordController,
                    labelText: 'Senha',
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: CustomColors.white,
                      size: 20,
                    ),
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
                  const SizedBoxSpacer(
                    percentage: 8,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) => CustomButton(
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
                          )),
                  const SizedBoxSpacer(
                    percentage: 2,
                  ),
                  CustomButton(
                    text: 'Entrar com Google',
                    buttonType: CustomButtonType.secondary,
                    onPressed: () {},
                  ),
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
          ),
        ),
      );
}
