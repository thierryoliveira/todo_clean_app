import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/theme/colors.dart';

void main() {
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
      ),
      home: Container(),
    );
  }
}
