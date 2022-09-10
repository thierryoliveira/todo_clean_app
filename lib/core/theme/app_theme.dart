import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  AppTheme._();
  static final theme = ThemeData(
      fontFamily: 'Quicksand',
      primaryColor: CustomColors.blue,
      backgroundColor: CustomColors.black,
      errorColor: CustomColors.red,
      scaffoldBackgroundColor: CustomColors.black,
      inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle:
              TextStyles.common.copyWith(color: CustomColors.blue),
          hintStyle: TextStyles.small,
          labelStyle: TextStyles.common,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: CustomColors.blue)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none)),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: CustomColors.blue));
}
