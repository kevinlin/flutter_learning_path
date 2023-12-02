// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_out_history_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOutHistoryPayloadImpl _$$WorkOutHistoryPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkOutHistoryPayloadImpl(
      json['workoutType'] as String,
      (json['exercises'] as List<dynamic>)
          .map((e) => ExerciseHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkOutHistoryPayloadImplToJson(
        _$WorkOutHistoryPayloadImpl instance) =>
    <String, dynamic>{
      'workoutType': instance.workoutType,
      'exercises': instance.exercises,
    };

_$ExerciseHistoryImpl _$$ExerciseHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseHistoryImpl(
      json['displayName'] as String,
      json['weight'] as String,
      (json['completedReps'] as List<dynamic>).map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$$ExerciseHistoryImplToJson(
        _$ExerciseHistoryImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'weight': instance.weight,
      'completedReps': instance.completedReps,
    };
