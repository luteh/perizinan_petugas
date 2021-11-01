import 'package:flutter/material.dart';
import 'package:perizinan_petugas/core/constants/strings.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';

import 'filled_field.dart';

class DetailFields extends StatelessWidget {
  const DetailFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.height37,
        bottom: Sizes.height26,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilledField(
            label: Strings.jenisIzin,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.nama,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.project,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.namaUnit,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.jenis,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.tipe,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.luasBangunan,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.luasTanah,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.noTelepon,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.lokasiPelaksanaan,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.tanggalPelaksanaan,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.jenisRenovasi,
            value: 'value',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.detailKegiatan,
            value: 'value',
            isDividerVisible: false,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
        ],
      ),
    );
  }
}
