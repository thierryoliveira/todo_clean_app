import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/cubit/auth_cubit.dart';
import 'package:todo_clean_solid/core/routes/auth_named_routes.dart';

import '../../../../extensions/build_context.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/text_styles.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/sized_box_spacer.dart';
import '../widgets/auth_header_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late AuthCubit _authCubit;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmationController;
  late TextEditingController _nameController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _authCubit = context.read<AuthCubit>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();
    _nameController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
                if (state is SignUpSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Conta criada com sucesso'),
                    backgroundColor: CustomColors.green,
                  ));
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
                      title: 'Criar uma conta',
                      subtitle: 'Por favor, preencha os campos abaixo'),
                  const SizedBoxSpacer(
                    percentage: 8,
                  ),
                  CustomTextfield(
                    controller: _nameController,
                    labelText: 'Nome',
                  ),
                  const SizedBoxSpacer(
                    percentage: 2,
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
                  const SizedBoxSpacer(
                    percentage: 2,
                  ),
                  CustomTextfield(
                    controller: _passwordConfirmationController,
                    labelText: 'Confirmação de senha',
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: CustomColors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBoxSpacer(
                    percentage: 8,
                  ),
                  CustomButton(
                    text: 'Criar conta',
                    onPressed: () async {
                      if (_formKey.currentState == null ||
                          !_formKey.currentState!.validate()) {
                        return;
                      }
                      await _authCubit.signUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: _nameController.text);
                    },
                  ),
                  const SizedBoxSpacer(
                    percentage: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Já tem uma conta?',
                        style: TextStyles.small,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AuthNamedRoutes.authSignIn);
                        },
                        child: Text(
                          'Entrar',
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
