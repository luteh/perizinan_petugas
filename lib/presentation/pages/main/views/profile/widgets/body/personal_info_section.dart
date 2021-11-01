import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_card.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_list_tile.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: Strings.personalInfo.toUpperCase(),
          fontSize: Sizes.sp16,
          color: ColorPalettes.textGrey,
          margin: EdgeInsets.only(
            top: Sizes.height38,
            left: Sizes.width20,
          ),
        ),
        MyCard(
          margin: EdgeInsets.only(
            left: Sizes.width20,
            right: Sizes.width20,
            top: Sizes.height13,
          ),
          shadowColor: Colors.black.withOpacity(0.16),
          blurRadius: Sizes.radius15,
          child: Column(
            children: ListTile.divideTiles(
              context: context,
              color: ColorPalettes.dividerGrey,
              tiles: [
                const MyListTile(
                  imageAsset: ImageAsset.icNama,
                  title: Strings.nama,
                  subtitle: 'Maria Genoveva Ashari',
                ),
                const MyListTile(
                  imageAsset: ImageAsset.icEmail,
                  title: Strings.email,
                  subtitle: 'Maria Genoveva Ashari',
                ),
                const MyListTile(
                  imageAsset: ImageAsset.icNoTelepon,
                  title: Strings.noTelepon,
                  subtitle: 'Maria Genoveva Ashari',
                ),
                const MyListTile(
                  imageAsset: ImageAsset.icGrup,
                  title: Strings.grup,
                  subtitle: 'Maria Genoveva Ashari',
                ),
              ],
            ).toList(),
          ),
        ),
      ],
    );
  }
}
