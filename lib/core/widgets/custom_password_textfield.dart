import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/widgets/custom_textfield.dart';

import '../theme/colors.dart';

class CustomPasswordTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autovalidateMode;

  const CustomPasswordTextfield(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.validator,
      this.autovalidateMode});

  @override
  State<CustomPasswordTextfield> createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) => CustomTextfield(
        controller: widget.controller,
        labelText: widget.labelText,
        hintText: widget.hintText,
        validator: widget.validator,
        autovalidateMode: widget.autovalidateMode,
        obscure: obscure,
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.visibility,
            color: CustomColors.white,
            size: 20,
          ),
          onPressed: () => setState(() {
            obscure = !obscure;
          }),
        ),
      );
}
