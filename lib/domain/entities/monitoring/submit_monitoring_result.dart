import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_monitoring_result.freezed.dart';

@freezed
class SubmitMonitoringResult with _$SubmitMonitoringResult {
  const factory SubmitMonitoringResult({
    required int id,
    int? amount,
    required List<Image> images,
  }) = _SubmitMonitoringResult;
}

@freezed
class Image with _$Image {
  const factory Image({
    required String image,
    required String description,
  }) = _Image;
}
