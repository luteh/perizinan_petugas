import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/monitoring_args.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/monitoring_page.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/cubit/without_permit_detail_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/widgets/body/hasil_monitoring_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HasilMonitoringView extends StatelessWidget {
  const HasilMonitoringView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _images =
        (context.read<WithoutPermitDetailCubit>().state.fetchDetailResult
                as Success<MonitoringWithoutSubmissionDetailEntity>)
            .data
            .images;

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
              return HasilMonitoringListItem(image: _images[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: Sizes.height38,
                color: ColorPalettes.dividerGrey,
              );
            },
            itemCount: _images.length,
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
