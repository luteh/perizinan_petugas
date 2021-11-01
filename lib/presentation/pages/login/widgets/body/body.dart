import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/presentation/pages/login/widgets/body/login_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAsset.bgDamaiPutra),
          fit: BoxFit.cover,
        ),
      ),
      child: LoginCard(),
    );
  }
}
