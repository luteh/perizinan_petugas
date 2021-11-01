import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final EdgeInsets? margin;

  const DatePickerField({
    Key? key,
    required this.label,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Wrap(
        direction: Axis.vertical,
        spacing: Sizes.height9,
        children: [
          MyText(
            text: label,
            fontSize: Sizes.sp14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(Sizes.radius5),
            onTap: () => _onTapField(context),
            child: Container(
              height: Sizes.height35,
              width: Sizes.width220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.radius5),
                border: Border.all(
                  color: ColorPalettes.borderGrey,
                  width: Sizes.width1,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.width15,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: '02 - 05 Januari 2021',
                      fontSize: Sizes.sp13,
                    ),
                  ),
                  Icon(
                    Icons.date_range_outlined,
                    size: Sizes.height18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTapField(BuildContext context) async {
    final _dateTimeRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    log('_dateTimeRange ${_dateTimeRange.toString()}');
  }
}
