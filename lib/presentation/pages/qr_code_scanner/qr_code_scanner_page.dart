import 'package:flutter/material.dart';
import 'package:perizinan_petugas/presentation/pages/qr_code_scanner/qr_code_scanner_result.dart';
import 'package:perizinan_petugas/presentation/pages/qr_code_scanner/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/qr_code_scanner/widgets/header/header.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

/// Can return result as [Barcode]
class QrCodeScannerPage extends StatelessWidget {
  static const routeName = '/qr-code-scanner';

  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            Body(),
            Header(),
          ],
        ),
      ),
    );
  }
}
