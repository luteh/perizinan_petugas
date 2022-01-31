import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../core/style/color_palettes.dart';
import '../../../../../core/style/sizes.dart';
import '../../../../../core/utils/navigation_util.dart';
import '../../../../../domain/entities/monitoring/permit_and_customer_detail_entity.dart';
import '../../../../core/widgets/my_text.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../monitoring/monitoring_args.dart';
import '../../../monitoring/monitoring_page.dart';
import '../../../monitoring_result.dart/monitoring_result_page.dart';
import '../../cubit/permission_detail_cubit.dart';

class Footer extends StatelessWidget {
  final PermitAndCustomerDetailEntity permitAndCustomerDetail;
  const Footer({Key? key, required this.permitAndCustomerDetail})
      : super(key: key);

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
    await NavigationUtil.pushNamed(MonitoringPage.routeName,
        arguments: MonitoringArgs(
            id: context.read<PermissionDetailCubit>().state.args.id));
  }

  _onTapSeeMonitoringResult(BuildContext context) async {
    await NavigationUtil.pushNamed(MonitoringResultPage.routeName);
  }
}
