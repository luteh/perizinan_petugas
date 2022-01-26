import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/style/sizes.dart';
import '../../../../core/utils/date_util.dart';
import '../../../../domain/entities/monitoring/permit_and_customer_detail_entity.dart';
import 'filled_field.dart';

class DetailFields extends StatelessWidget {
  final PermitAndCustomerDetailEntity permitAndCustomerDetail;
  const DetailFields({Key? key, required this.permitAndCustomerDetail})
      : super(key: key);

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
            value: permitAndCustomerDetail.permitDetail.name,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.nama,
            value: permitAndCustomerDetail.customerDetail.name,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.project,
            value: permitAndCustomerDetail.customerDetail.unitProjectName,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.namaUnit,
            value: permitAndCustomerDetail.customerDetail.unitName,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.jenis,
            value: permitAndCustomerDetail.customerDetail.unitCategoryName,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.tipe,
            value: permitAndCustomerDetail.customerDetail.unitTypeName,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.luasBangunan,
            value: permitAndCustomerDetail.customerDetail.unitBuildingArea,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.luasTanah,
            value: permitAndCustomerDetail.customerDetail.unitLandArea,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.noTelepon,
            value: permitAndCustomerDetail.customerDetail.phoneNumber,
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.lokasiPelaksanaan,
            value:
                '${permitAndCustomerDetail.permitDetail.location.firstOrNull?.latitude ?? ''}, ${permitAndCustomerDetail.permitDetail.location.firstOrNull?.longitude ?? ''}',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          FilledField(
            label: Strings.tanggalPelaksanaan,
            value:
                '${permitAndCustomerDetail.permitDetail.startDate} - ${permitAndCustomerDetail.permitDetail.endDate}',
            isDividerVisible: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.width16,
            ),
          ),
          // FilledField(
          //   label: Strings.jenisRenovasi,
          //   value: 'Sedang',
          //   isDividerVisible: true,
          //   padding: EdgeInsets.symmetric(
          //     horizontal: Sizes.width16,
          //   ),
          // ),
          FilledField(
            label: Strings.detailKegiatan,
            value: permitAndCustomerDetail.permitDetail.description,
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
