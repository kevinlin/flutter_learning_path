// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_out_upcoming_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOutUpcomingPayloadImpl _$$WorkOutUpcomingPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkOutUpcomingPayloadImpl(
      date: DateTime.parse(json['date'] as String),
      workoutType: json['workoutType'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => ExerciseUpcoming.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkOutUpcomingPayloadImplToJson(
        _$WorkOutUpcomingPayloadImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'workoutType': instance.workoutType,
      'exercises': instance.exercises,
    };

_$ExerciseUpcomingImpl _$$ExerciseUpcomingImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseUpcomingImpl(
      displayName: json['displayName'] as String,
      weight: json['weight'] as num,
      targetReps: json['targetReps'] as int,
      targetSets: json['targetSets'] as int,
    );

Map<String, dynamic> _$$ExerciseUpcomingImplToJson(
        _$ExerciseUpcomingImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'weight': instance.weight,
      'targetReps': instance.targetReps,
      'targetSets': instance.targetSets,
    };
