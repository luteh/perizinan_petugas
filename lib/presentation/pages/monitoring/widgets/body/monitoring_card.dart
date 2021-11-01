import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_card.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_form_field.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/monitoring/widgets/body/add_photo_item.dart';
import 'package:perizinan_petugas/presentation/monitoring/widgets/body/total_biaya_form.dart';

class MonitoringCard extends StatelessWidget {
  const MonitoringCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              top: Sizes.height37,
            ),
            itemBuilder: (BuildContext context, int index) {
              return AddPhotoItem();
            },
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: Sizes.height32,
                thickness: 1,
                color: ColorPalettes.dividerGrey,
              );
            },
          ),
          const TotalBiayaForm(),
          SizedBox(
            height: Sizes.height34,
          ),
        ],
      ),
    );
  }

  _onPressAddPhoto(BuildContext context) {}
}
