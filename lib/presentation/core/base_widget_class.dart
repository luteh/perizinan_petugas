import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/get_util.dart';
import 'package:perizinan_petugas/core/widgets/loading_dialog.dart';

mixin BaseWidgetClass {
  Flushbar showFlushbar(BuildContext context, String? title, String? message,
      {bool isTopPosition = false, dynamic thenEvent, bool isError = true}) {
    return Flushbar(
      title: message != null ? title : null,
      message: message ?? title,
      titleSize: Sizes.sp16,
      messageSize: message != null ? Sizes.sp14 : Sizes.sp16,
      backgroundColor: isError
          ? Colors.red.withOpacity(0.56)
          : ColorPalettes.primary.withOpacity(0.56),
      flushbarPosition:
          isTopPosition ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      padding: EdgeInsets.all(Sizes.width15),
      isDismissible: false,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 3),
    )..show(context).then((_) => thenEvent);
  }

  showLoadingDialog() async {
    await GetUtil.showDialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
  }

  dismissDialog() {
    GetUtil.dismissDialog();
  }
}
