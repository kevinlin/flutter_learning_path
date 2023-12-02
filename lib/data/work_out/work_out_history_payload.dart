import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_out_history_payload.freezed.dart';
part 'work_out_history_payload.g.dart';

@freezed
class WorkOutHistoryPayload with _$WorkOutHistoryPayload {
  const factory WorkOutHistoryPayload(
      String workoutType,
      List<ExerciseHistory> exercises,
      ) = _WorkOutHistoryPayload;

  factory WorkOutHistoryPayload.fromJson(Map<String, dynamic> json) =>
      _$WorkOutHistoryPayloadFromJson(json);
}

@freezed
class ExerciseHistory with _$ExerciseHistory {
  factory ExerciseHistory(
      String displayName,
      String weight,
      List<int?> completedReps,
      ) = _ExerciseHistory;

  factory ExerciseHistory.fromJson(Map<String, dynamic> json) =>
      _$ExerciseHistoryFromJson(json);
}