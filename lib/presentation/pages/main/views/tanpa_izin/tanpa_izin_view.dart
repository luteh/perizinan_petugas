import 'package:flutter/material.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/tanpa_izin/widgets/header/header.dart';

import 'widgets/body/body.dart';

class TanpaIzinView extends StatelessWidget {
  const TanpaIzinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Body(),
        Header(),
      ],
    );
  }
}
