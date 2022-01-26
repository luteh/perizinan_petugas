import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_and_customer_detail_entity.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_detail_entity.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/pages/permission_detail/widgets/detail_fields.dart';

class DetailCard extends StatelessWidget {
  final PermitAndCustomerDetailEntity permitAndCustomerDetail;

  const DetailCard({Key? key, required this.permitAndCustomerDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Sizes.width20,
        vertical: Sizes.height47,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.radius10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: Sizes.radius6,
            color: ColorPalettes.shadowGrey,
          ),
        ],
      ),
      child: Column(
        children: [
          MyText(
            text: permitAndCustomerDetail.permitDetail.submissionStatus,
            color: Colors.red,
            margin: EdgeInsets.only(
              top: Sizes.height34,
            ),
            fontSize: Sizes.sp14,
            fontWeight: FontWeight.w500,
          ),
          DetailFields(
            permitAndCustomerDetail: permitAndCustomerDetail,
          ),
        ],
      ),
    );
  }
}
