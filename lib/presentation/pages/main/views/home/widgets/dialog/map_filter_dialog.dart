import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/home/cubit/home_cubit.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/home/widgets/dialog/date_picker_field.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/home/widgets/dialog/dropdown_field.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/home/widgets/dialog/show_button.dart';

class MapFilterDialog extends StatelessWidget {
  final BuildContext parentContext;
  const MapFilterDialog({Key? key, required this.parentContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Material(
        borderRadius: BorderRadius.circular(Sizes.radius10),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.width12,
            vertical: Sizes.height21,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropDownField(
                label: Strings.labelChoosePermissionStatus,
                items: parentContext
                    .read<HomeCubit>()
                    .state
                    .submissionStatuses
                    .map((e) => e.name)
                    .toList(),
                onChanged: (value) =>
                    _onChangePermissionStatus(parentContext, value),
              ),
              DropDownField(
                label: Strings.labelChoosePermissionType,
                items: parentContext
                    .read<HomeCubit>()
                    .state
                    .permitTypes
                    .map((e) => e.name)
                    .toList(),
                onChanged: (value) =>
                    _onChangePermissionType(parentContext, value),
                margin: EdgeInsets.only(
                  top: Sizes.height17,
                ),
              ),
              DatePickerField(
                label: Strings.labelChooseExecutionDate,
                margin: EdgeInsets.only(
                  top: Sizes.height17,
                ),
              ),
              ShowButton(
                margin: EdgeInsets.only(
                  top: Sizes.height29,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onChangePermissionStatus(BuildContext parentContext, String? value) {}

  _onChangePermissionType(BuildContext parentContext, String? value) {}
}
