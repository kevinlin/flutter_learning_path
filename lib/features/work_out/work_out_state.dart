import 'package:flutter/foundation.dart';
import 'package:flutter_learning_path/data/work_out/work_out_history_payload.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';

@immutable
class WorkOutState {
  const WorkOutState({
    required this.workOut,
    required this.exerciseRecords,
    required this.isSubmitting,
  });

  final WorkOutUpcomingPayload workOut;
  final List<ExerciseHistory> exerciseRecords;
  final bool isSubmitting;

  WorkOutState copyWith(
      {WorkOutUpcomingPayload? workOut,
      List<ExerciseHistory>? exerciseRecords,
      bool? isSubmitting}) {
    return WorkOutState(
      workOut: workOut ?? this.workOut,
      exerciseRecords: exerciseRecords ?? this.exerciseRecords,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
