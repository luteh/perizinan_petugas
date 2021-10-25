import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/monitoring/monitoring_args.dart';
import 'package:perizinan_petugas/presentation/monitoring/monitoring_page.dart';
import 'package:perizinan_petugas/presentation/without_permit_detail/widgets/body/hasil_monitoring_list_item.dart';

class HasilMonitoringView extends StatelessWidget {
  const HasilMonitoringView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              top: Sizes.height75,
            ),
            itemBuilder: (context, index) {
              return const HasilMonitoringListItem();
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: Sizes.height38,
                color: ColorPalettes.dividerGrey,
              );
            },
            itemCount: 3,
          ),
          PrimaryButton(
            text: Strings.uploadHasilMonitoring,
            onPressed: () => _onPressUpload(context),
            margin: EdgeInsets.only(
              top: Sizes.height44,
              bottom: Sizes.height29,
            ),
          ),
        ],
      ),
    );
  }

  _onPressUpload(BuildContext context) async {
    await NavigationUtil.pushNamed(
      MonitoringPage.routeName,
      arguments: const MonitoringArgs(
        title: Strings.fotoMonitoring,
      ),
    );
  }
}
