
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_profile_response.freezed.dart';
part 'get_profile_response.g.dart';

@freezed
class GetProfileResponse with _$GetProfileResponse {
  const factory GetProfileResponse({
    required int? id,
    required String? name,
    required String? emailAddress,
    required bool? isEmailAddressConfirmed,
    required String? phoneNumber,
    required bool? isPhoneNumberConfirmed,
    required String? groupName,
    required String? idCardNumber,
    required String? idCardImageUrl,
    required String? status,
  }) = _GetProfileResponse;

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
}
