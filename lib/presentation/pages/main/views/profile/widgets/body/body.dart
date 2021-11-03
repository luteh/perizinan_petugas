import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_error_widget.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/profile/cubit/profile_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/profile/widgets/body/general_info_section.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/profile/widgets/body/personal_info_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.getProfileResult != current.getProfileResult,
      builder: (context, state) {
        return state.getProfileResult.when(
          initial: () => const SizedBox.shrink(),
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (data) {
            return RefreshIndicator(
              onRefresh: () async => _onRefresh(context),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                primary: true,
                child: Column(
                  children: [
                    PersonalInfoSection(
                      profileResponse: data.data,
                    ),
                    const GeneralInfoSection(),
                  ],
                ),
              ),
            );
          },
          error: (failure) {
            return MyErrorWidget(
              failure: failure,
              onPressRetry: () => _onPressRetry(context),
            );
          },
        );
      },
    );
  }

  _onPressRetry(BuildContext context) {
    context.read<ProfileCubit>().getProfile();
  }

  _onRefresh(BuildContext context) {
    context.read<ProfileCubit>().getProfile();
  }
}
