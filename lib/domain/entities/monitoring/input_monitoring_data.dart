import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_monitoring_data.freezed.dart';

@freezed
class InputMonitoringData with _$InputMonitoringData {
  const InputMonitoringData._();
  const factory InputMonitoringData({
    required File? imageFile,
    required String? keterangan,
  }) = _InputMonitoringData;

  bool get isFilled {
    return imageFile != null || keterangan != null;
  }

  bool get isNotFilled {
    return imageFile == null || keterangan == null;
  }
}
