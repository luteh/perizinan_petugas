import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/main/views/home/widgets/body/icon_card.dart';
import 'package:perizinan_petugas/presentation/main/views/home/widgets/dialog/map_filter_dialog.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: Sizes.width20,
        bottom: Sizes.width27,
      ),
      child: Wrap(
        direction: Axis.vertical,
        spacing: Sizes.height13,
        children: [
          IconCard(
            imageAsset: ImageAsset.icMapType,
            onTap: () => _onTapMapType(context),
          ),
          IconCard(
            imageAsset: ImageAsset.icGps,
            onTap: () => _onTapGps(context),
          ),
          IconCard(
            imageAsset: ImageAsset.icQrCode,
            onTap: () => _onTapQrCode(context),
          ),
        ],
      ),
    );
  }

  _onTapMapType(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => MapFilterDialog(
        parentContext: context,
      ),
    );
  }

  _onTapGps(BuildContext context) {}

  _onTapQrCode(BuildContext context) {}
}
