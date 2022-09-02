import 'package:flutter/material.dart';
import 'core/features/auth/presenter/pages/signup_page.dart';
import 'core/injections/firebase_initialize.dart';
import 'core/theme/colors.dart';
import 'core/theme/text_styles.dart';

void main() async {
  await FirebaseInitalize.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
              const TextSelectionThemeData(cursorColor: CustomColors.blue)),
      home: const SignUpPage(),
    );
  }
}
