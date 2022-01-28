import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../../../core/widgets/primary_button.dart';

class ShowButton extends StatelessWidget {
  final EdgeInsets? margin;
  final Function() onPressed;
  const ShowButton({Key? key, this.margin, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: PrimaryButton(
        text: Strings.show,
        onPressed: onPressed,
      ),
    );
  }
}
