import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/change_password/widgets/body/body.dart';

class ChangePasswordPage extends StatelessWidget {
  static const String routeName = '/change-password';

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.ubahKataSandi,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAsset.bgDamaiPutra),
            fit: BoxFit.cover,
          ),
        ),
        child: const Body(),
      ),
    );
  }
}
