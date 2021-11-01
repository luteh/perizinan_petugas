import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_card.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_list_tile.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_text.dart';
import 'package:perizinan_petugas/presentation/pages/change_password/change_password_page.dart';
import 'package:perizinan_petugas/presentation/pages/login/login_page.dart';

class GeneralInfoSection extends StatelessWidget {
  const GeneralInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: Strings.generalInfo.toUpperCase(),
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
            children: [
              MyListTile(
                imageAsset: ImageAsset.icUbahKataSandi,
                title: Strings.ubahKataSandi,
                onTap: () => _onTapUbahKataSandi(context),
              ),
              MyListTile(
                imageAsset: ImageAsset.icLogout,
                title: Strings.logout,
                onTap: () => _onTapLogout(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onTapLogout(BuildContext context) async {
    await NavigationUtil.pushNamedAndRemoveUntil(LoginPage.routeName);
  }

  _onTapUbahKataSandi(BuildContext context) async {
    await NavigationUtil.pushNamed(ChangePasswordPage.routeName);
  }
}
