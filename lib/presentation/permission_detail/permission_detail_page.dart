import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/permission_detail/widgets/detail_card.dart';
import 'package:perizinan_petugas/presentation/permission_detail/widgets/footer/footer.dart';
import 'package:perizinan_petugas/presentation/permission_detail/widgets/unit_perumahan_section.dart';

class PermissionDetailPage extends StatelessWidget {
  static const routeName = '/permission-detail';
  const PermissionDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.permissionDetail,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: const [
                DetailCard(),
                Footer(),
              ],
            ),
            Positioned(
              top: Sizes.height20,
              left: Sizes.width117,
              right: Sizes.width117,
              child: const UnitPerumahanSection(),
            ),
          ],
        ),
      ),
    );
  }
}
