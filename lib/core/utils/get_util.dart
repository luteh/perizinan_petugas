import 'package:flutter/material.dart';
import 'navigation_util.dart';
import 'package:get/get.dart';

import '../style/sizes.dart';
import '../unions/failure.dart';

class GetUtil {
  const GetUtil._();

  static dynamic getArgument() => Get.arguments;

  static get isBottomSheetOpen => Get.isBottomSheetOpen;
  static get isDialogOpen => Get.isDialogOpen;
  static get currentRoute => Get.currentRoute;
  static get previousRoute => Get.previousRoute;
  static BuildContext get context {
    if (Get.context == null) throw const Failure.unexpectedError();
    return Get.context!;
  }

  static void contextChecked({
    Function()? onNullContext,
    required Function(BuildContext) onChecked,
  }) {
    if (Get.context == null) {
      onNullContext?.call();
      return;
    }

    onChecked(Get.context!);
  }

  static Future<void> showDialog(
    Widget dialogWidget, {
    bool barrierDismissible = true,
  }) async {
    await Get.dialog(
      dialogWidget,
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<void> showBottomSheet(Widget bottomSheetWidget) async {
    await Get.bottomSheet(
      bottomSheetWidget,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.radius16),
          topRight: Radius.circular(Sizes.radius16),
        ),
      ),
    );
  }

  static dismissDialog() {
    if (isDialogOpen) {
      NavigationUtil.popUntil();
    }
  }
}
