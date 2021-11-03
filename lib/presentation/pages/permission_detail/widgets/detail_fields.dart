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
            value: 'Izin Renovasi',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.nama,
            value: 'Maria Genoveva Ashari',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.project,
            value: 'Baltic Segara City',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.namaUnit,
            value: 'Rum1 Baltic Segara City Blok SC2.10 No 01',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.jenis,
            value: 'Rumah',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.tipe,
            value: 'Rumah 1',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.luasBangunan,
            value: '53',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.luasTanah,
            value: '148',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.noTelepon,
            value: '08966533332',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.lokasiPelaksanaan,
            value: '7.7809616,110.4619592',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.tanggalPelaksanaan,
            value: '02 - 05 Desember 2020',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.jenisRenovasi,
            value: 'Sedang',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.detailKegiatan,
            value: 'Mengadakan acara grand opening toko',
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
