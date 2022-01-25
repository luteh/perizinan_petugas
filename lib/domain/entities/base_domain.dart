import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_domain.freezed.dart';

@freezed
class BaseDomain<T> with _$BaseDomain<T> {
  const factory BaseDomain({
    required bool succeeded,
    required String message,
    required List<String> errors,
    required T data,
  }) = _BaseDomain;
}
