import 'package:flutter_learning_path/common/logger.dart';
import 'package:flutter_learning_path/data/work_out/work_out_history_payload.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:flutter_learning_path/features/work_out/work_out_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _initialState = WorkOutState(
  workOut: WorkOutUpcomingPayload(date: DateTime.now(), workoutType: '', exercises: []),
  exerciseRecords: [],
  isSubmitting: false,
);

class WorkOutNotifier extends Notifier<WorkOutState> {
  @override
  WorkOutState build() {
    return _initialState;
  }

  final _repository = DefaultWorkOutRepository();

  void setWorkOut(WorkOutUpcomingPayload value) {
    List<ExerciseHistory> exerciseRecords = state.exerciseRecords;

    if (exerciseRecords.isEmpty) {
      exerciseRecords = value.exercises
          .map(
              (e) => ExerciseHistory(e.displayName, '${e.weight}', List.filled(e.targetSets, null)))
          .toList();
    }

    state = state.copyWith(workOut: value, exerciseRecords: exerciseRecords);
  }

  void updateExerciseRecord(int exerciseIndex, int setIndex, int? count) {
    // make a copy of the existing records
    final exerciseRecords = [...state.exerciseRecords];

    final originalRecord = exerciseRecords[exerciseIndex];
    // update the record, spread completedReps to avoid mutating collection
    // (this is important for later, when we use freezed library)
    final updatedRecord = originalRecord.copyWith(
      completedReps: [...originalRecord.completedReps]..[setIndex] = count,
      // ..[xx] = y, allows you to change an index of an array inline
    );

    // mutate copy of records
    exerciseRecords[exerciseIndex] = updatedRecord;

    state = state.copyWith(exerciseRecords: exerciseRecords);
  }

  Future<bool> submitWorkOut() async {
    state = state.copyWith(isSubmitting: true);

    try {
      final record = WorkOutHistoryPayload(state.workOut.workoutType, state.exerciseRecords);
      await _repository.submitWorkOut(record);
      state = _initialState;
      return true;
    } catch (error) {
      state = state.copyWith(isSubmitting: false);
      logger.d(error);
      return false;
    }
  }
}

final $workout = NotifierProvider<WorkOutNotifier, WorkOutState>(() => WorkOutNotifier());
