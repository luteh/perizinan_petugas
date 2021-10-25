import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/code_verification/code_verification_args.dart';
import 'package:perizinan_petugas/presentation/code_verification/widgets/body/body.dart';

/// Required arguments as [CodeVerificationArgs]
class CodeVerificationPage extends StatelessWidget {
  static const routeName = '/code-verification';

  const CodeVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.verifikasiKode,
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
