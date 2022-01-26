import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_error_widget.dart';
import 'package:perizinan_petugas/presentation/pages/permission_detail/cubit/permission_detail_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/permission_detail/widgets/detail_card.dart';
import 'package:perizinan_petugas/presentation/pages/permission_detail/widgets/footer/footer.dart';
import 'package:perizinan_petugas/presentation/pages/permission_detail/widgets/unit_perumahan_section.dart';

/// Must pass arguments as [PermissionDetailArgs]
class PermissionDetailPage extends StatelessWidget {
  static const routeName = '/permission-detail';
  const PermissionDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.permissionDetail,
        ),
      ),
      body: BlocBuilder<PermissionDetailCubit, PermissionDetailState>(
        buildWhen: (previous, current) =>
            previous.fetchPermitDetailResult != current.fetchPermitDetailResult,
        builder: (context, state) {
          return state.fetchPermitDetailResult.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        DetailCard(
                          permitDetail: data,
                        ),
                        Footer(
                          permitDetail: data,
                        ),
                      ],
                    ),
                    Positioned(
                      top: Sizes.height20,
                      left: Sizes.width117,
                      right: Sizes.width117,
                      child: UnitPerumahanSection(
                        permitDetail: data,
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (failure) {
              return MyErrorWidget(
                failure: failure,
                onPressRetry: () {
                  context.read<PermissionDetailCubit>().fetchPermitDetail();
                },
              );
            },
          );
        },
      ),
    );
  }
}
