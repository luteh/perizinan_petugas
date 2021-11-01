import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/widgets/header/header.dart';

class WithoutPermitDetailPage extends StatelessWidget {
  static const routeName = '/without-permit-detail';
  const WithoutPermitDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.withoutPermitDetail,
        ),
      ),
      body: Stack(
        children: const [
          Body(),
          Header(),
        ],
      ),
    );
  }
}
