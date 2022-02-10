import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/src/form_builder.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../core/style/color_palettes.dart';
import '../../../../../core/style/sizes.dart';
import '../../../../../core/utils/navigation_util.dart';
import '../../../../core/widgets/my_text.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../monitoring/monitoring_args.dart';
import '../../../monitoring/monitoring_page.dart';
import '../../cubit/monitoring_data_cubit.dart';

class Footer extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const Footer({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => _onTapUploadMonitoringPhoto(context),
          child: MyText(
            text: Strings.uploadFotoMonitoring,
            fontSize: Sizes.sp16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: ColorPalettes.primary,
            margin: EdgeInsets.only(
              left: Sizes.width20,
              top: Sizes.height43,
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        PrimaryButton(
          text: Strings.simpan,
          margin: EdgeInsets.only(
            top: Sizes.height45,
            bottom: Sizes.height31,
          ),
          onPressed: () => _onPressSave(context),
        ),
      ],
    );
  }

  _onPressSave(BuildContext context) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final _name = formKey.currentState!.value[Strings.nama];
      final _unitPerumahan = formKey.currentState!.value[Strings.unitPerumahan];
      final _noTelepon = formKey.currentState!.value[Strings.noTelepon];
      final _alamat = formKey.currentState!.value[Strings.alamat];
      final _deskripsiKegiatan =
          formKey.currentState!.value[Strings.deskripsiKegiatan];

      context.read<MonitoringDataCubit>().submitMonitoringData(
            name: _name,
            unitName: _unitPerumahan,
            phoneNumber: _noTelepon,
            address: _alamat,
            description: _deskripsiKegiatan,
          );
      // NavigationUtil.popUntil();

    }
  }

  _onTapUploadMonitoringPhoto(BuildContext context) async {
    final _result = await NavigationUtil.pushNamed(
      MonitoringPage.routeName,
      arguments: MonitoringArgs(
        title: Strings.fotoMonitoring,
        inputMonitoringDatas:
            context.read<MonitoringDataCubit>().state.inputMonitoringDatas,
        // monitoringType: MonitoringType.editWithoutPermit,
      ),
    );

    context.read<MonitoringDataCubit>().saveInputMonitoringDatas(_result);
  }
}
