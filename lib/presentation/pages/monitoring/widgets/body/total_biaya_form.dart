import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/currency_formatter.dart';
import 'package:perizinan_petugas/core/utils/get_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_form_field.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/cubit/monitoring_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/permission_detail/permission_detail_page.dart';

class TotalBiayaForm extends StatelessWidget {
  const TotalBiayaForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (GetUtil.previousRoute == PermissionDetailPage.routeName) {
      return Column(
        children: [
          Divider(
            height: Sizes.height32,
            thickness: 1,
            color: ColorPalettes.dividerGrey,
          ),
          MyFormField(
            label: Strings.totalBiayaKerusakan,
            hint: Strings.hintTotalBiayaKerusakan,
            // initialValue: 'Rp250.000',
            padding: EdgeInsets.only(
              left: Sizes.width18,
              right: Sizes.width18,
              top: Sizes.height22,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.deny(RegExp(r'^0')),
              CurrencyFormatter(),
            ],
            onChanged: (value) {
              context.read<MonitoringCubit>().changeAmount(value);
            },
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
