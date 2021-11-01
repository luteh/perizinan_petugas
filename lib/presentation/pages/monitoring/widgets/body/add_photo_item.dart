import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_card.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_form_field.dart';

class AddPhotoItem extends StatelessWidget {
  const AddPhotoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.width18,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              MyCard(
                child: Icon(
                  Icons.hide_image_outlined,
                  size: Sizes.width80,
                  color: ColorPalettes.grey50,
                ),
                shadowColor: Colors.black.withOpacity(0.16),
                blurRadius: Sizes.radius10,
                offset: const Offset(0, 2),
                margin: EdgeInsets.only(
                  right: Sizes.width20,
                  bottom: Sizes.height5,
                ),
              ),
              Positioned(
                right: 14,
                bottom: 0,
                child: ClipOval(
                  child: Material(
                    color: ColorPalettes.bgRed,
                    child: InkWell(
                      onTap: () => _onTapPhotoIcon(context),
                      child: Padding(
                        padding: EdgeInsets.all(Sizes.width5),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: Sizes.width14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Expanded(
            child: MyFormField(
              label: Strings.keterangan,
              hint: Strings.masukkanKeterangan,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  _onTapPhotoIcon(BuildContext context) {}
}
