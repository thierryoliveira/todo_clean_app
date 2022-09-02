import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum CustomButtonType {
  primary(backgrounColor: CustomColors.blue, textColor: CustomColors.white),
  secondary(backgrounColor: CustomColors.white, textColor: CustomColors.grey);

  final Color backgrounColor;
  final Color textColor;
  const CustomButtonType(
      {required this.backgrounColor, required this.textColor});
}
