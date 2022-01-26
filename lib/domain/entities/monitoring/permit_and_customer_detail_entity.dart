import 'package:perizinan_petugas/domain/entities/monitoring/detail_customer_entity.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/permit_detail_entity.dart';

class PermitAndCustomerDetailEntity {
  final PermitDetailEntity permitDetail;
  final DetailCustomerEntity customerDetail;

  PermitAndCustomerDetailEntity(this.permitDetail, this.customerDetail);
}
