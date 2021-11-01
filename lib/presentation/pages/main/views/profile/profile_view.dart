import 'package:flutter/material.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/profile/widgets/body/body.dart';
import 'package:perizinan_petugas/presentation/pages/main/views/profile/widgets/header/header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(),
        Body(),
      ],
    );
  }
}
