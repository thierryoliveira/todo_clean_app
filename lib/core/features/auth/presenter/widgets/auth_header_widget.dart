import 'package:flutter/material.dart';

import '../../../../theme/text_styles.dart';
import '../../../../widgets/sized_box_spacer.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthHeaderWidget(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyles.header1,
          ),
          const SizedBoxSpacer(
            percentage: 1,
          ),
          Text(
            subtitle,
            style: TextStyles.small,
          ),
        ],
      );
}
