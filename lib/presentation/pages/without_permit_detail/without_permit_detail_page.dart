import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_error_widget.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/cubit/without_permit_detail_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/widgets/header/header.dart';

/// Must pass arguments as [WithoutPermitDetailArgs]
class WithoutPermitDetailPage extends StatelessWidget {
  static const routeName = '/without-permit-detail';
  const WithoutPermitDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.withoutPermitDetail,
        ),
      ),
      body: BlocBuilder<WithoutPermitDetailCubit, WithoutPermitDetailState>(
        buildWhen: (previous, current) =>
            previous.fetchDetailResult != current.fetchDetailResult,
        builder: (context, state) {
          return state.fetchDetailResult.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) {
              return Stack(
                children: const [
                  Body(),
                  Header(),
                ],
              );
            },
            error: (failure) {
              return MyErrorWidget(
                failure: failure,
                onPressRetry: () {
                  context.read<WithoutPermitDetailCubit>().fetchDetail();
                },
              );
            },
          );
        },
      ),
    );
  }
}
