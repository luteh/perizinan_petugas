import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height187,
      decoration: const BoxDecoration(
        color: Colors.white,
        // image: DecorationImage(
        //   image: AssetImage(ImageAsset.logoBeautyyGlow),
        // ),
      ),
    );
  }
}
