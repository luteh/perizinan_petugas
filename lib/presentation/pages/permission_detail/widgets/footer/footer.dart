import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/monitoring_page.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_result.dart/monitoring_result_page.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => _onTapSeeMonitoringResult(context),
          child: MyText(
            text: Strings.lihatHasilMonitoring,
            fontSize: Sizes.sp16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: ColorPalettes.primary,
            margin: EdgeInsets.only(
              left: Sizes.width20,
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        PrimaryButton(
          text: Strings.monitoring,
          margin: EdgeInsets.only(
            top: Sizes.height45,
            bottom: Sizes.height26,
          ),
          onPressed: () => _onPressMonitoring(context),
        ),
      ],
    );
  }

  _onPressMonitoring(BuildContext context) async {
    await NavigationUtil.pushNamed(MonitoringPage.routeName);
  }

  _onTapSeeMonitoringResult(BuildContext context) async {
    await NavigationUtil.pushNamed(MonitoringResultPage.routeName);
  }
}
