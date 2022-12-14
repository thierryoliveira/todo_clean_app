import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();
  static const _baseStyle = TextStyle(color: Colors.white);
  static final small = _baseStyle.copyWith(fontSize: 12);
  static final common = _baseStyle.copyWith(fontSize: 16);
  static final header1 =
      _baseStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  static final header2 =
      _baseStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w600);
  static final header3 =
      _baseStyle.copyWith(fontSize: 48, fontWeight: FontWeight.w600);
}
