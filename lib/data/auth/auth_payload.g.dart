// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthPayloadImpl _$$AuthPayloadImplFromJson(Map<String, dynamic> json) =>
    _$AuthPayloadImpl(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$$AuthPayloadImplToJson(_$AuthPayloadImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
