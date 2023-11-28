class WorkOutHistoryPayload {
  String workoutType;
  List<ExerciseHistory> exercises;

  WorkOutHistoryPayload(this.workoutType, this.exercises);

  @override
  String toString() {
    return 'WorkOutHistoryPayload{workoutType: $workoutType, exercises: $exercises}';
  }

  factory WorkOutHistoryPayload.fromJson(Map<String, dynamic> json) {
    return WorkOutHistoryPayload(
      json['workoutType'] as String,
      (json['exercises'] as List<dynamic>)
          .map((exerciseJson) => ExerciseHistory.fromJson(exerciseJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutType': workoutType,
      'exercises': exercises.map((exercise) => exercise.toJson()).toList()
    };
  }
}

class ExerciseHistory {
  String displayName;
  String weight;
  List<int?> completedReps;

  ExerciseHistory(this.displayName, this.weight, this.completedReps);

  ExerciseHistory copyWith({String? displayName, String? weight, List<int?>? completedReps}) {
    return ExerciseHistory(
      displayName ?? this.displayName,
      weight ?? this.weight,
      completedReps ?? this.completedReps,
    );
  }

  factory ExerciseHistory.fromJson(Map<String, dynamic> json) {
    return ExerciseHistory(
      json['displayName'] as String,
      json['weight'] as String,
      (json['completedReps'] as List<dynamic>).cast<int>(),
    );
  }

  @override
  String toString() {
    return 'ExerciseHistory{displayName: $displayName, weight: $weight, completedReps: $completedReps}';
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'weight': weight,
      'completedReps': completedReps,
    };
  }
}
