import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/extensions/build_context.dart';
import 'package:todo_clean_solid/core/theme/colors.dart';
import 'package:todo_clean_solid/core/widgets/custom_button.dart';
import 'package:todo_clean_solid/core/widgets/custom_textfield.dart';
import 'package:todo_clean_solid/core/widgets/sized_box_spacer.dart';
import 'package:todo_clean_solid/features/auth/presenter/widgets/auth_header_widget.dart';

import '../../../../core/theme/text_styles.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .05),
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
              const CustomTextfield(
                labelText: 'Nome',
              ),
              const SizedBoxSpacer(
                percentage: 2,
              ),
              const CustomTextfield(
                labelText: 'Email',
              ),
              const SizedBoxSpacer(
                percentage: 2,
              ),
              const CustomTextfield(
                labelText: 'Senha',
                suffixIcon: Icon(
                  Icons.visibility,
                  color: CustomColors.white,
                  size: 20,
                ),
              ),
              const SizedBoxSpacer(
                percentage: 2,
              ),
              const CustomTextfield(
                labelText: 'Confirmação de senha',
                suffixIcon: Icon(
                  Icons.visibility,
                  color: CustomColors.white,
                  size: 20,
                ),
              ),
              const SizedBoxSpacer(
                percentage: 8,
              ),
              const CustomButton(text: 'Criar conta'),
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
                    onPressed: () {},
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
      );
}
