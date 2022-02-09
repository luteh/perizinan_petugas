import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/image_asset.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/style/color_palettes.dart';
import '../../../../../core/utils/date_util.dart';
import '../../../../../domain/core/unions/result_state.dart';
import '../../../../../domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';
import '../../../../core/widgets/my_list_tile.dart';
import '../../cubit/without_permit_detail_cubit.dart';

class InformasiUmumFields extends StatelessWidget {
  const InformasiUmumFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _detail =
        (context.read<WithoutPermitDetailCubit>().state.fetchDetailResult
                as Success<MonitoringWithoutSubmissionDetailEntity>)
            .data;

    return Column(
      children: ListTile.divideTiles(
        context: context,
        color: ColorPalettes.dividerGrey,
        tiles: [
          MyListTile(
            imageAsset: ImageAsset.icNama,
            title: Strings.nama,
            subtitle: _detail.name,
          ),
          MyListTile(
            imageAsset: ImageAsset.icUnitPerumahan,
            title: Strings.unitPerumahan,
            subtitle: _detail.unitName,
          ),
          MyListTile(
            imageAsset: ImageAsset.icAlamat,
            title: Strings.alamat,
            subtitle: _detail.address,
          ),
          MyListTile(
            imageAsset: ImageAsset.icNoTelepon,
            title: Strings.noTelepon,
            subtitle: _detail.phoneNumber,
          ),
          // MyListTile(
          //   imageAsset: ImageAsset.icEmail,
          //   title: Strings.email,
          //   subtitle: 'anggraini@gmail.com',
          // ),
          MyListTile(
            imageAsset: ImageAsset.icTanggalPelaksanaan,
            title: Strings.tanggalPelaksanaan,
            subtitle: DateUtil.toFormattedDate(_detail.monitoringDate),
          ),
          MyListTile(
            imageAsset: ImageAsset.icDetailKegiatan,
            title: Strings.detailKegiatan,
            subtitle: _detail.description,
          ),
        ],
      ).toList(),
    );
  }
}
