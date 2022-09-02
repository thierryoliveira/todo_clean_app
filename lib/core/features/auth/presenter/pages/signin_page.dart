import 'package:flutter/material.dart';
import '../../../../enums/custom_button_type.dart';
import '../../../../extensions/build_context.dart';
import '../../../../theme/colors.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/sized_box_spacer.dart';

import '../../../../theme/text_styles.dart';
import '../widgets/auth_header_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
                  title: 'Bem vindo!', subtitle: 'Entre para continuar'),
              const SizedBoxSpacer(
                percentage: 8,
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
              const CustomButton(text: 'Entrar'),
              const SizedBoxSpacer(
                percentage: 2,
              ),
              const CustomButton(
                text: 'Entrar com Google',
                buttonType: CustomButtonType.secondary,
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
                    onPressed: () {},
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
      );
}
