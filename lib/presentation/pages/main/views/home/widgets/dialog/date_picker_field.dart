import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: label,
            fontSize: Sizes.sp14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            margin: EdgeInsets.only(
              bottom: Sizes.height9,
            ),
          ),
          FormBuilderDateRangePicker(
            decoration: InputDecoration(
              constraints: BoxConstraints.tightFor(
                height: Sizes.height35,
                // width: Sizes.width220,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.radius5),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.width15,
              ),
              suffixIcon: Icon(
                Icons.date_range_outlined,
                size: Sizes.height18,
              ),
            ),
            style: TextStyle(
              fontSize: Sizes.sp13,
            ),
            firstDate: DateTime(1945),
            lastDate: DateTime(2101),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            name: '',
            format: DateFormat('dd MMM yyyy', 'id'),
          ),
        ],
      ),
    );
  }
}
