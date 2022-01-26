import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_and_customer_detail_entity.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_detail_entity.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class UnitPerumahanSection extends StatelessWidget {
  final PermitAndCustomerDetailEntity permitAndCustomerDetail;
  const UnitPerumahanSection({Key? key, required this.permitAndCustomerDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.width24,
        vertical: Sizes.height8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.radius10),
        color: ColorPalettes.primary,
      ),
      child: Column(
        children: [
          MyText(
            text: Strings.unitPerumahan,
            fontSize: Sizes.sp12,
            color: Colors.white,
          ),
          MyText(
            text: permitAndCustomerDetail.customerDetail.unitCode,
            fontSize: Sizes.sp12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            margin: EdgeInsets.only(
              top: Sizes.height4,
            ),
          ),
        ],
      ),
    );
  }
}
