import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../style/sizes.dart';
import '../utils/theme_util.dart';
import '../widgets/my_text.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: Sizes.width40,
        vertical: Sizes.height24,
      ),
      child: Container(
        padding: EdgeInsets.all(Sizes.width16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.radius10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
                // strokeWidth: Sizes.width4,
                ),
            SizedBox(
              height: Sizes.height16,
            ),
            MyText(
              text: Strings.loading,
              color: ThemeUtil.primaryColor,
              fontSize: Sizes.sp14,
            )
          ],
        ),
      ),
    );
  }
}
