import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_domain.freezed.dart';

@freezed
class BaseDomain with _$BaseDomain {
  const factory BaseDomain({
    required bool succeeded,
    required String message,
  }) = _BaseDomain;
}
