import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:perizinan_petugas/presentation/core/base_widget_class.dart';
import 'package:perizinan_petugas/presentation/core/libraries/permission_helper.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/home/widgets/body/icon_card.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/home/widgets/dialog/map_filter_dialog.dart';
import 'package:perizinan_petugas/presentation/pages/permission_detail/permission_detail_page.dart';
import 'package:perizinan_petugas/presentation/pages/qr_code_scanner/qr_code_scanner_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ActionButtons extends StatelessWidget with BaseWidgetClass {
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

  _onTapQrCode(BuildContext context) async {
    await PermissionHelper.requestPermissionCamera(
      onGranted: () async {
        final _result =
            await NavigationUtil.pushNamed(QrCodeScannerPage.routeName);

        if (_result is Barcode) {
          await NavigationUtil.pushNamed(PermissionDetailPage.routeName);
        }
      },
      onDenied: () {
        showFlushbar(
          context,
          null,
          Strings.msgQRCameraPermissionDenied,
        );
      },
    );
  }
}
