import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autovalidateMode;
  const CustomTextfield(
      {Key? key,
      this.controller,
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.autovalidateMode = AutovalidateMode.onUserInteraction})
      : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        autovalidateMode: autovalidateMode,
        style: const TextStyle(color: CustomColors.white),
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            labelText: labelText,
            filled: true,
            fillColor: CustomColors.grey,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
      );
}
