import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_out_upcoming_payload.freezed.dart';
part 'work_out_upcoming_payload.g.dart';

@freezed
class WorkOutUpcomingPayload with _$WorkOutUpcomingPayload {
  const factory WorkOutUpcomingPayload({
    required DateTime date,
    required String workoutType,
    required List<ExerciseUpcoming> exercises,
  }) = _WorkOutUpcomingPayload;

  factory WorkOutUpcomingPayload.fromJson(Map<String, dynamic> json) =>
      _$WorkOutUpcomingPayloadFromJson(json);
}

@freezed
class ExerciseUpcoming with _$ExerciseUpcoming {
  const factory ExerciseUpcoming({
    required String displayName,
    required num weight,
    required int targetReps,
    required int targetSets,
  }) = _ExerciseUpcoming;

  factory ExerciseUpcoming.fromJson(Map<String, dynamic> json) => _$ExerciseUpcomingFromJson(json);
}
