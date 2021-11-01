import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/monitoring_data_args.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/monitoring_data_page.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/widgets/body/informasi_umum_fields.dart';

class InformasiUmumView extends StatelessWidget {
  const InformasiUmumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.height68,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const InformasiUmumFields(),
            PrimaryButton(
              margin: EdgeInsets.only(
                top: Sizes.height40,
                bottom: Sizes.height36,
              ),
              text: Strings.ubah,
              onPressed: () => onPressUbah(context),
            ),
          ],
        ),
      ),
    );
  }

  onPressUbah(BuildContext context) async {
    await NavigationUtil.pushNamed(
      MonitoringDataPage.routeName,
      arguments: const MonitoringDataArgs(),
    );
  }
}
