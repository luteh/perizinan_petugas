import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:perizinan_petugas/domain/entities/monitoring/monitoring_result_detail_entity.dart';

import '../../domain/core/unions/failure.dart';
import '../../domain/entities/base_domain.dart';
import '../../domain/entities/monitoring/detail_customer_entity.dart';
import '../../domain/entities/monitoring/input_monitoring_data.dart';
import '../../domain/entities/monitoring/monitoring_entity.dart';
import '../../domain/entities/monitoring/permit_detail_entity.dart';
import '../../domain/repositories/monitoring_repository.dart';
import '../remote/monitoring/monitoring_remote_data_source.dart';
import '../remote/monitoring/request/submit_monitoring_result_request.dart';

@LazySingleton(as: MonitoringRepository)
class MonitoringRepositoryImpl implements MonitoringRepository {
  final MonitoringRemoteDataSource _remoteDataSource;

  MonitoringRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<MonitoringEntity>>> fetchMonitoringList(
    String keyword,
    String? permitStatus,
    int? permitTypeId,
    DateTime? startDate,
    DateTime? endDate,
  ) async {
    final _response = await _remoteDataSource.fetchMonitoringList(
      keyword,
      permitStatus,
      permitTypeId,
      startDate,
      endDate,
    );
    return Right(_response.data.map((e) => e.toDomain()).toList());
  }

  @override
  Future<Either<Failure, PermitDetailEntity>> fetchPermitDetail(int id) async {
    final _response = await _remoteDataSource.fetchPermitDetail(id);
    return Right(_response.data.toDomain());
  }

  @override
  Future<Either<Failure, DetailCustomerEntity>> fetchDetailCustomer(
      int id) async {
    final _response = await _remoteDataSource.fetchCustomerDetail(id);
    return Right(_response.data.toDomain());
  }

  @override
  Future<Either<Failure, BaseDomain>> submitMonitoringResult(
    int id,
    int amount,
    List<InputMonitoringData> inputMonitoringDatas,
  ) async {
    final _response = await _remoteDataSource
        .submitMonitoringResult(SubmitMonitoringResultRequest(
      id: id,
      amount: amount,
      images: inputMonitoringDatas
          .map((e) => ImageRequest(
                image: base64Encode(e.imageFile!.readAsBytesSync()),
                description: e.keterangan!,
              ))
          .toList(),
    ));
    return Right(_response.toDomain());
  }

  @override
  Future<Either<Failure, MonitoringResultDetailEntity>>
      fetchMonitoringResultDetail(int submissionId) async {
    final _response =
        await _remoteDataSource.fetchMonitoringResultDetail(submissionId);
    return Right(_response.data.toDomain());
  }
}
