import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/email_verification/widgets/body/body.dart';

class EmailVerificationPage extends StatelessWidget {
  static const routeName = '/email-verification';
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.verifikasiEmail,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAsset.bgDamaiPutra),
            fit: BoxFit.cover,
          ),
        ),
        child: Body(),
      ),
    );
  }
}
