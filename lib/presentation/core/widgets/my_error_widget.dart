import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';

import '../../../core/style/sizes.dart';
import '../../../domain/core/unions/failure.dart';
import 'my_text.dart';
import 'primary_button.dart';

class MyErrorWidget extends StatelessWidget {
  final Failure failure;
  final Function() onPressRetry;
  const MyErrorWidget({
    Key? key,
    required this.failure,
    required this.onPressRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _message = Failure.getErrorMessage(failure);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            text: _message,
            fontSize: Sizes.sp18,
            color: ColorPalettes.textGrey,
          ),
          SizedBox(
            height: Sizes.height16,
          ),
          PrimaryButton(
            onPressed: () {
              onPressRetry.call();
            },
            text: 'Retry',
          ),
        ],
      ),
    );
  }
}
