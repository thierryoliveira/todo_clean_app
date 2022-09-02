import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/enums/custom_button_type.dart';
import 'package:todo_clean_solid/core/extensions/build_context.dart';
import 'package:todo_clean_solid/core/theme/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final CustomButtonType buttonType;
  const CustomButton(
      {Key? key,
      required this.text,
      this.buttonType = CustomButtonType.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: context.height * .08,
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => buttonType.backgrounColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide.none))),
            child: Text(
              text,
              style: TextStyles.common.copyWith(color: buttonType.textColor),
            )),
      );
}
