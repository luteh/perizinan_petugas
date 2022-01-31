import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/domain/core/unions/failure.dart';
import 'package:perizinan_petugas/presentation/core/base_widget_class.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_card.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/cubit/monitoring_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/widgets/body/add_photo_item.dart';
import 'package:perizinan_petugas/presentation/pages/monitoring/widgets/body/total_biaya_form.dart';

class MonitoringCard extends StatefulWidget {
  const MonitoringCard({Key? key}) : super(key: key);

  @override
  State<MonitoringCard> createState() => _MonitoringCardState();
}

class _MonitoringCardState extends State<MonitoringCard> with BaseWidgetClass {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MonitoringCubit, MonitoringState>(
      listenWhen: (previous, current) =>
          previous.validateInputMonitoringDataResult !=
          current.validateInputMonitoringDataResult,
      listener: (context, state) {
        state.validateInputMonitoringDataResult.maybeWhen(
          error: (failure) =>
              showFlushbar(context, null, Failure.getErrorMessage(failure)),
          success: (_) {
            if (context.read<MonitoringCubit>().state.eventType ==
                EventType.addPhoto) {
              context.read<MonitoringCubit>().addMoreInputMonitoringItem();
            }
          },
          orElse: () => null,
        );
      },
      child: MyCard(
        margin: EdgeInsets.only(
          left: Sizes.width20,
          right: Sizes.width20,
          top: Sizes.height36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Sizes.width18,
                top: Sizes.height20,
              ),
              child: ElevatedButton(
                onPressed: () => _onPressAddPhoto(context),
                child: const MyText(
                  text: Strings.tambahFoto,
                  color: Colors.white,
                ),
              ),
            ),
            FormBuilder(
              key: _formKey,
              child: BlocBuilder<MonitoringCubit, MonitoringState>(
                buildWhen: (previous, current) =>
                    previous.inputMonitoringResult !=
                    current.inputMonitoringResult,
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      top: Sizes.height37,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AddPhotoItem(
                        index: index,
                        inputMonitoringData: state.inputMonitoringDatas[index],
                      );
                    },
                    itemCount: state.inputMonitoringDatas.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: Sizes.height32,
                        thickness: 1,
                        color: ColorPalettes.dividerGrey,
                      );
                    },
                  );
                },
              ),
            ),
            const TotalBiayaForm(),
            SizedBox(
              height: Sizes.height34,
            ),
          ],
        ),
      ),
    );
  }

  _onPressAddPhoto(BuildContext context) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    context.read<MonitoringCubit>().validateInputMonitoringDatas();
  }
}
