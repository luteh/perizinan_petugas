import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';
import 'package:perizinan_petugas/core/utils/get_util.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_form_field.dart';
import 'package:perizinan_petugas/presentation/pages/without_permit_detail/without_permit_detail_page.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const Body({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nama = '';
    String unitPerumahan = '';
    String noTelepon = '';
    String alamat = '';
    String deksripsiKegiatan = '';

    if (GetUtil.previousRoute == WithoutPermitDetailPage.routeName) {
      nama = 'Maria Genoveva Ashari';
      unitPerumahan = 'BC-01';
      noTelepon = '0811263368777';
      alamat = 'Jalan Diponegoro No. 43, Kalasan, Sleman Yogyakarta';
      deksripsiKegiatan = 'Mengadakan shooting dan pemotretan';
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.width20,
      ),
      child: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            MyFormField(
              label: Strings.nama,
              hint: Strings.nama,
              name: Strings.nama,
              padding: EdgeInsets.only(
                top: Sizes.height24,
              ),
              initialValue: nama,
            ),
            MyFormField(
              label: Strings.unitPerumahan,
              hint: Strings.unitPerumahan,
              name: Strings.unitPerumahan,
              padding: EdgeInsets.only(
                top: Sizes.height24,
              ),
              initialValue: unitPerumahan,
            ),
            MyFormField(
              label: Strings.noTelepon,
              hint: Strings.noTelepon,
              name: Strings.noTelepon,
              padding: EdgeInsets.only(
                top: Sizes.height24,
              ),
              initialValue: noTelepon,
            ),
            MyFormField(
              label: Strings.alamat,
              hint: Strings.alamat,
              name: Strings.alamat,
              maxLines: 3,
              padding: EdgeInsets.only(
                top: Sizes.height24,
              ),
              initialValue: alamat,
            ),
            MyFormField(
              label: Strings.deskripsiKegiatan,
              hint: Strings.deskripsiKegiatan,
              name: Strings.deskripsiKegiatan,
              maxLines: 4,
              padding: EdgeInsets.only(
                top: Sizes.height24,
              ),
              initialValue: deksripsiKegiatan,
            ),
          ],
        ),
      ),
    );
  }
}
