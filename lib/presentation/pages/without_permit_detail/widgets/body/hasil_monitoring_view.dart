import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../core/style/color_palettes.dart';
import '../../../../../core/style/sizes.dart';
import '../../../../../core/utils/navigation_util.dart';
import '../../../../../domain/core/unions/result_state.dart';
import '../../../../../domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../monitoring/monitoring_args.dart';
import '../../../monitoring/monitoring_page.dart';
import '../../cubit/without_permit_detail_cubit.dart';
import 'hasil_monitoring_list_item.dart';

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
    final _state = context.read<WithoutPermitDetailCubit>().state;
    final _detail = (_state.fetchDetailResult
            as Success<MonitoringWithoutSubmissionDetailEntity>)
        .data;
    final _result = await NavigationUtil.pushNamed(
      MonitoringPage.routeName,
      arguments: MonitoringArgs(
        title: Strings.fotoMonitoring,
        withoutPermitDetail: _detail,
        monitoringType: MonitoringType.editWithoutPermitImagesOnly,
        latitude: _state.args!.latitude,
        longitude: _state.args!.longitude,
      ),
    );

    if (_result == true) {
      context.read<WithoutPermitDetailCubit>().fetchDetail();
    }
  }
}
