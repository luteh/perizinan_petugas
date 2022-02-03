import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/my_error_widget.dart';
import 'cubit/tanpa_izin_cubit.dart';
import 'widgets/body/body.dart';
import 'widgets/header/header.dart';

class TanpaIzinView extends StatelessWidget {
  const TanpaIzinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<TanpaIzinCubit, TanpaIzinState>(
          buildWhen: (previous, current) =>
              previous.fetchMonitoringWithoutSubmissionsResult !=
              current.fetchMonitoringWithoutSubmissionsResult,
          builder: (context, state) {
            return state.fetchMonitoringWithoutSubmissionsResult.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (data) {
                return Body(
                  monitoringWithoutSubmissions: data,
                );
              },
              error: (failure) {
                return MyErrorWidget(
                  failure: failure,
                  onPressRetry: () {
                    context
                        .read<TanpaIzinCubit>()
                        .fetchMonitoringWithoutSubmissions();
                  },
                );
              },
            );
          },
        ),
        const Header(),
      ],
    );
  }
}
