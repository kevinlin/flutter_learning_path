// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataPayloadImpl _$$UserDataPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDataPayloadImpl(
      json['id'] as String,
      $enumDecodeNullable(_$GenderTypeEnumMap, json['gender']),
      json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      json['height'] as int,
      json['weight'] as int,
    );

Map<String, dynamic> _$$UserDataPayloadImplToJson(
        _$UserDataPayloadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': _$GenderTypeEnumMap[instance.gender],
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'height': instance.height,
      'weight': instance.weight,
    };

const _$GenderTypeEnumMap = {
  GenderType.MALE: 'MALE',
  GenderType.FEMALE: 'FEMALE',
};
