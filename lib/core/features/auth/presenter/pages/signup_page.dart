import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/enums/sized_box_spacer_type.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/cubit/auth_cubit.dart';
import 'package:todo_clean_solid/core/features/auth/presenter/widgets/auth_appbar.dart';
import 'package:todo_clean_solid/core/validators/validators.dart';
import 'package:todo_clean_solid/core/widgets/custom_password_textfield.dart';

import '../../../../extensions/build_context.dart';
import '../../../../routes/auth_named_routes.dart';
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
        appBar: const AuthAppbar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * .05, vertical: context.height * .04),
          child: Form(
            key: _formKey,
            child: BlocListener<AuthCubit, AuthState>(
              bloc: _authCubit,
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Account created successfully'),
                    backgroundColor: CustomColors.green,
                  ));
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.messsage),
                    backgroundColor: CustomColors.red,
                  ));
                }
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
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
                          validator: CustomValidators.isRequired(),
                        ),
                        const SizedBoxSpacer(
                          percentage: 2,
                        ),
                        CustomTextfield(
                          controller: _emailController,
                          labelText: 'Email',
                          validator: CustomValidators.multiple([
                            CustomValidators.isRequired(),
                            CustomValidators.isValidEmail()
                          ]),
                        ),
                        const SizedBoxSpacer(
                          percentage: 2,
                        ),
                        CustomPasswordTextfield(
                          controller: _passwordController,
                          labelText: 'Senha',
                          validator: CustomValidators.isValidPassword(
                              controller: _passwordController,
                              errorMessage: 'Senha muito fraca'),
                        ),
                        const SizedBoxSpacer(
                          percentage: 2,
                        ),
                        CustomPasswordTextfield(
                          controller: _passwordConfirmationController,
                          labelText: 'Confirmação de senha',
                          validator: CustomValidators.compare(
                              controller: _passwordController,
                              errorMessage: 'Senhas não coincidem'),
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBoxSpacer(
                          percentage: 1,
                          type: SizedBoxSpacerType.vertical,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return CustomButton(
                                isLoading: state is SignUpLoading,
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
                              );
                            },
                          ),
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
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
