import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/permission_detail/widgets/detail_fields.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({Key? key}) : super(key: key);

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
            text: 'Sedang Berjalan',
            color: Colors.red,
            margin: EdgeInsets.only(
              top: Sizes.height34,
            ),
            fontSize: Sizes.sp14,
            fontWeight: FontWeight.w500,
          ),
          DetailFields(),
        ],
      ),
    );
  }
}
