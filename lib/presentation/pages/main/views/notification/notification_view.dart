import 'package:flutter/material.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/notification/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/notification/widgets/header/header.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(),
        Expanded(
          child: Body(),
        ),
      ],
    );
  }
}
