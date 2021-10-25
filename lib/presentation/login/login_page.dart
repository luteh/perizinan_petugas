import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/widgets/my_colored_status_bar.dart';

import 'widgets/body/body.dart';
import 'widgets/header/header.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: ColorPalettes.primary),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyColoredStatusBar(
                  color: ColorPalettes.primary,
                ),
                Column(
                  children: const [
                    Header(),
                    Body(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
