import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../../../../core/style/sizes.dart';
import '../../../../../../../core/utils/navigation_util.dart';
import '../../cubit/home_cubit.dart';
import 'date_picker_field.dart';
import 'dropdown_field.dart';
import 'show_button.dart';

class MapFilterDialog extends StatefulWidget {
  final BuildContext parentContext;
  const MapFilterDialog({Key? key, required this.parentContext})
      : super(key: key);

  @override
  State<MapFilterDialog> createState() => _MapFilterDialogState();
}

class _MapFilterDialogState extends State<MapFilterDialog> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

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
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropDownField(
                  initialValue:
                      widget.parentContext.read<HomeCubit>().state.permitStatus,
                  label: Strings.labelChoosePermissionStatus,
                  items: widget.parentContext
                      .read<HomeCubit>()
                      .state
                      .submissionStatuses
                      .map((e) => e.name)
                      .toList(),
                  onChanged: (value) =>
                      _onChangePermissionStatus(widget.parentContext, value),
                  name: Strings.labelChoosePermissionStatus,
                ),
                DropDownField(
                  initialValue:
                      widget.parentContext.read<HomeCubit>().state.permitType,
                  label: Strings.labelChoosePermissionType,
                  items: widget.parentContext
                      .read<HomeCubit>()
                      .state
                      .permitTypes
                      .map((e) => e.name)
                      .toList(),
                  onChanged: (value) =>
                      _onChangePermissionType(widget.parentContext, value),
                  margin: EdgeInsets.only(
                    top: Sizes.height17,
                  ),
                  name: Strings.labelChoosePermissionType,
                ),
                DatePickerField(
                  initialValue: widget.parentContext
                      .read<HomeCubit>()
                      .state
                      .dateTimeRange,
                  label: Strings.labelChooseExecutionDate,
                  margin: EdgeInsets.only(
                    top: Sizes.height17,
                  ),
                  name: Strings.labelChooseExecutionDate,
                ),
                ShowButton(
                  margin: EdgeInsets.only(
                    top: Sizes.height29,
                  ),
                  onPressed: () {
                    _formKey.currentState?.save();
                    final String? _permitStatus = _formKey.currentState
                        ?.value[Strings.labelChoosePermissionStatus];
                    final String? _permitType = _formKey
                        .currentState?.value[Strings.labelChoosePermissionType];
                    final DateTimeRange? _dateTimeRange = _formKey
                        .currentState?.value[Strings.labelChooseExecutionDate];

                    widget.parentContext.read<HomeCubit>().fetchMonitoringList(
                          permitStatus: _permitStatus,
                          permitType: _permitType,
                          dateTimeRange: _dateTimeRange,
                        );

                    NavigationUtil.popUntil();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onChangePermissionStatus(BuildContext parentContext, String? value) {}

  _onChangePermissionType(BuildContext parentContext, String? value) {}
}
