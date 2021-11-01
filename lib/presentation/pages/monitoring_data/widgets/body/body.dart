import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_form_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.width20,
      ),
      child: Column(
        children: [
          MyFormField(
            label: Strings.nama,
            hint: Strings.nama,
            padding: EdgeInsets.only(
              top: Sizes.height24,
            ),
          ),
          MyFormField(
            label: Strings.unitPerumahan,
            hint: Strings.unitPerumahan,
            padding: EdgeInsets.only(
              top: Sizes.height24,
            ),
          ),
          MyFormField(
            label: Strings.noTelepon,
            hint: Strings.noTelepon,
            padding: EdgeInsets.only(
              top: Sizes.height24,
            ),
          ),
          MyFormField(
            label: Strings.alamat,
            hint: Strings.alamat,
            maxLines: 3,
            padding: EdgeInsets.only(
              top: Sizes.height24,
            ),
          ),
          MyFormField(
            label: Strings.deskripsiKegiatan,
            hint: Strings.deskripsiKegiatan,
            maxLines: 4,
            padding: EdgeInsets.only(
              top: Sizes.height24,
            ),
          ),
        ],
      ),
    );
  }
}
