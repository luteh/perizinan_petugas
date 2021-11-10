import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => _onTapClose(context),
          child: Padding(
            padding: EdgeInsets.all(Sizes.width20),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: Sizes.width24,
            ),
          ),
        ),
        MyText(
          text: Strings.scanQrCode,
          color: Colors.white,
          fontSize: Sizes.sp18,
          fontWeight: FontWeight.bold,
          margin: EdgeInsets.only(
            top: Sizes.width20,
          ),
          alignment: Alignment.topCenter,
        ),
      ],
    );
  }

  _onTapClose(BuildContext context) {
    NavigationUtil.popUntil();
  }
}
