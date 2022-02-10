import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/unions/failure.dart';
import '../../domain/entities/monitoring/input_monitoring_data.dart';
import '../../domain/entities/monitoring_without_submission/monitoring_without_submission_detail_entity.dart';
import '../../domain/entities/monitoring_without_submission/monitoring_without_submission_entity.dart';
import '../../domain/repositories/monitoring_without_submission_repository.dart';
import '../remote/monitoring_without_submission/monitoring_without_submission_remote_data_source.dart';
import '../remote/monitoring_without_submission/request/submit_monitoring_data_request.dart';

@LazySingleton(as: MonitoringWithoutSubmissionRepository)
class MonitoringWithoutSubmissionRepositoryImpl
    implements MonitoringWithoutSubmissionRepository {
  final MonitoringWithoutSubmissionRemoteDataSource _remoteDataSource;

  MonitoringWithoutSubmissionRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<MonitoringWithoutSubmissionEntity>>>
      fetchMonitoringWithoutSubmissions(String keyword) async {
    final _response =
        await _remoteDataSource.fetchMonitoringWithoutSubmissions(keyword);
    return Right(_response.data.map((e) => e.toDomain()).toList());
  }

  @override
  Future<Either<Failure, String>> submitMonitoringData({
    required int? id,
    required String name,
    required String unitName,
    required String phoneNumber,
    required String address,
    required String description,
    required double latitude,
    required double longitude,
    required List<InputMonitoringData> inputMonitoringDatas,
  }) async {
    final _response = await _remoteDataSource.submitMonitoringData(
      SubmitMonitoringDataRequest(
        customerName: name,
        unitName: unitName,
        phoneNumber: phoneNumber,
        address: address,
        // tanggal: DateUtil.formatCurrentDate(),
        detailKegiatan: description,
        longitude: longitude,
        latitude: latitude,
        images: inputMonitoringDatas
            .map((e) => ImageRequest(
                  image: base64Encode(e.imageFile!.readAsBytesSync()),
                  description: e.keterangan!,
                ))
            .toList(),
      ),
      id: id,
    );

    return Right(_response.message ?? 'Berhasil submit data');
  }

  @override
  Future<Either<Failure, MonitoringWithoutSubmissionDetailEntity>>
      fetchMonitoringWithoutSubmissionDetail(int id) async {
    final _response =
        await _remoteDataSource.fetchMonitoringWithoutSubmissionDetail(id);
    return Right(_response.data.toDomain());
  }
}
