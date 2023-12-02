import 'package:flutter_learning_path/features/sign_up/gender_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_payload.freezed.dart';
part 'user_data_payload.g.dart';

@freezed
class UserDataPayload with _$UserDataPayload {
  const factory UserDataPayload(
      String id,
      GenderType? gender,
      DateTime? dateOfBirth,
      int height,
      int weight,
      ) = _UserDataPayload;

  factory UserDataPayload.fromJson(Map<String, dynamic> json) =>
      _$UserDataPayloadFromJson(json);
}