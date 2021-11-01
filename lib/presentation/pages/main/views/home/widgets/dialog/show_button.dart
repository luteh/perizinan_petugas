import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';

class ShowButton extends StatelessWidget {
  final EdgeInsets? margin;
  const ShowButton({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: PrimaryButton(
        text: Strings.show,
        onPressed: () => _onPressShow(context),
      ),
    );
  }

  _onPressShow(BuildContext context) {}
}
