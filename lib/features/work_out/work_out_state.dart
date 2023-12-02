import 'package:flutter/foundation.dart';
import 'package:flutter_learning_path/data/work_out/work_out_history_payload.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_out_state.freezed.dart';

@freezed
class WorkOutState with _$WorkOutState {
  const factory WorkOutState({
    required WorkOutUpcomingPayload workOut,
    required List<ExerciseHistory> exerciseRecords,
    required bool isSubmitting,
  }) = _WorkOutState;
}
