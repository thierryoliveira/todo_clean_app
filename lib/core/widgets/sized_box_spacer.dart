import 'package:flutter/material.dart';
import 'package:todo_clean_solid/core/enums/sized_box_spacer_type.dart';
import 'package:todo_clean_solid/core/extensions/build_context.dart';

class SizedBoxSpacer extends StatelessWidget {
  final int percentage;
  final SizedBoxSpacerType type;
  const SizedBoxSpacer(
      {Key? key,
      required this.percentage,
      this.type = SizedBoxSpacerType.vertical})
      : assert(percentage >= 1 && percentage <= 100,
            'The percentage must be between 1 and 100'),
        super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: type == SizedBoxSpacerType.vertical
            ? context.height * (percentage / 100)
            : null,
        width: type == SizedBoxSpacerType.horizontal
            ? context.width * ((percentage / 100))
            : null,
      );
}
