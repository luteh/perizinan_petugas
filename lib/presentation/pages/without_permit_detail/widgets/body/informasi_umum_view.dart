import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/domain/core/unions/result_state.dart';
import 'package:perizinan_petugas/domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';
import 'package:perizinan_petugas/presentation/core/widgets/primary_button.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/monitoring_data_args.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring_data/monitoring_data_page.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/cubit/without_permit_detail_cubit.dart';
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
    final _state = context.read<WithoutPermitDetailCubit>().state;
    final _result = await NavigationUtil.pushNamed(
      MonitoringDataPage.routeName,
      arguments: MonitoringDataArgs(
          latitude: _state.args?.latitude ?? 0,
          longitude: _state.args?.longitude ?? 0,
          withoutPermitDetail: (_state.fetchDetailResult
                  as Success<MonitoringWithoutSubmissionDetailEntity>)
              .data),
    );

    if (_result == true) {
      context.read<WithoutPermitDetailCubit>().fetchDetail();
    }
  }
}
