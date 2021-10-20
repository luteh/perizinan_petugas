import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/login/widgets/body/login_button.dart';
import 'package:perizinan_petugas/presentation/login/widgets/body/login_form.dart';
import 'package:perizinan_petugas/presentation/login/widgets/body/login_title.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.heightFull - Sizes.height220,
      padding: EdgeInsets.all(Sizes.width33),
      decoration: const BoxDecoration(
        color: ColorPalettes.maroon2,
        // image: DecorationImage(
        //   image: AssetImage(ImageAsset.bgBeautyyGlow),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Column(
        children: const [
          LoginTitle(),
          LoginForm(),
          LoginButton(),
        ],
      ),
    );
  }
}
