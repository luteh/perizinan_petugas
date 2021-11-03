import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/image_asset.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/color_palettes.dart';
import 'package:perizinan_petugas/presentation/core/widgets/my_list_tile.dart';

class InformasiUmumFields extends StatelessWidget {
  const InformasiUmumFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ListTile.divideTiles(
        context: context,
        color: ColorPalettes.dividerGrey,
        tiles: [
          const MyListTile(
            imageAsset: ImageAsset.icNama,
            title: Strings.nama,
            subtitle: 'Maria Genoveva Ashari',
          ),
          const MyListTile(
            imageAsset: ImageAsset.icUnitPerumahan,
            title: Strings.unitPerumahan,
            subtitle: 'BC-01',
          ),
          const MyListTile(
            imageAsset: ImageAsset.icAlamat,
            title: Strings.alamat,
            subtitle: 'Jalan Diponegoro No. 43, Kalasan, Sleman Yogyakarta',
          ),
          const MyListTile(
            imageAsset: ImageAsset.icNoTelepon,
            title: Strings.noTelepon,
            subtitle: '0811263368777',
          ),
          const MyListTile(
            imageAsset: ImageAsset.icEmail,
            title: Strings.email,
            subtitle: 'anggraini@gmail.com',
          ),
          const MyListTile(
            imageAsset: ImageAsset.icTanggalPelaksanaan,
            title: Strings.tanggalPelaksanaan,
            subtitle: '02 Desember 2020',
          ),
          const MyListTile(
            imageAsset: ImageAsset.icDetailKegiatan,
            title: Strings.detailKegiatan,
            subtitle: 'Mengadakan shooting dan pemotretan',
          ),
        ],
      ).toList(),
    );
  }
}
