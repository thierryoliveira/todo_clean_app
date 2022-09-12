import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/theme/colors.dart';

class AuthAppbar extends StatelessWidget with PreferredSizeWidget {
  const AuthAppbar({super.key});

  @override
  Widget build(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: CustomColors.black,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * .7);
}
