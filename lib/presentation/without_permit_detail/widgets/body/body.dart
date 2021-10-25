import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/theme_util.dart';
import 'package:perizinan_petugas/core/widgets/fade_indexed_stack.dart';
import 'package:perizinan_petugas/core/widgets/my_card.dart';
import 'package:perizinan_petugas/presentation/without_permit_detail/cubit/without_permit_detail_cubit.dart';
import 'package:perizinan_petugas/presentation/without_permit_detail/widgets/body/hasil_monitoring_view.dart';
import 'package:perizinan_petugas/presentation/without_permit_detail/widgets/body/informasi_umum_view.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      margin: EdgeInsets.symmetric(
        horizontal: Sizes.width20,
        vertical: Sizes.height50,
      ),
      child:
          BlocSelector<WithoutPermitDetailCubit, WithoutPermitDetailState, int>(
                selector: (state) {
          return state.tabIndex;
                },
                builder: (context, state) {
          return FadeIndexedStack(
            index: state,
            duration: ThemeUtil.shortAnimationDuration,
            children: [
              InformasiUmumView(),
              HasilMonitoringView(),
            ],
          );
                },
              ),
    );
  }
}
