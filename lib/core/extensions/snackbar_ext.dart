import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../style/sizes.dart';
import '../../presentation/core/widgets/my_text.dart';

extension SnackbarExt on BuildContext {
  ScaffoldFeatureController showErrorSnackbar(String message,
      {String? title, int durationInSeconds = 3}) {
    return ScaffoldMessenger.of(this).showSnackBar(
      _buildSnackBar(
        message: message,
        durationInSeconds: durationInSeconds,
        color: Colors.red,
      ),
    );
  }

  ScaffoldFeatureController showInfoSnackbar(String message,
      {String? title, int durationInSeconds = 3}) {
    return ScaffoldMessenger.of(this).showSnackBar(
      _buildSnackBar(
          message: message,
          durationInSeconds: durationInSeconds,
          color: Colors.black),
    );
  }

  ScaffoldFeatureController showSuccessSnackbar(String message,
      {String? title, int durationInSeconds = 3}) {
    return ScaffoldMessenger.of(this).showSnackBar(
      _buildSnackBar(
        message: message,
        durationInSeconds: durationInSeconds,
        color: Colors.green,
      ),
    );
  }

  _buildSnackBar({
    required String message,
    required int durationInSeconds,
    required Color color,
  }) {
    return SnackBar(
      duration: Duration(seconds: durationInSeconds),
      behavior: SnackBarBehavior.floating,
      // width: Sizes.widthHalf,
      // padding: EdgeInsets.symmetric(
      //   vertical: Sizes.height8,
      //   horizontal: Sizes.width8,
      // ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius10),
      ),
      backgroundColor: color,
      content: _buildMessageText(message),
    );
  }

  _buildMessageText(String message) {
    return MyText(
      text: message,
      color: Colors.white,
      fontSize: Sizes.sp14,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.center,
    );
  }
}
