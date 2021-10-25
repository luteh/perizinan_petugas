import 'package:flutter/material.dart';
import 'package:perizinan_petugas/presentation/main/views/profile/widgets/body/general_info_section.dart';
import 'package:perizinan_petugas/presentation/main/views/profile/widgets/body/personal_info_section.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PersonalInfoSection(),
        GeneralInfoSection(),
      ],
    );
  }
}