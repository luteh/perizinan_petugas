import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/utils/navigation_util.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyQr extends StatelessWidget {
  const MyQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QRView(
      onQRViewCreated: _onQRViewCreated,
      key: GlobalKey(debugLabel: 'QR'),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      controller.dispose();
      NavigationUtil.popUntil(result: scanData);
    });
  }
}
