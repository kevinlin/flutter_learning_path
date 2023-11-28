class WorkOutUpcomingPayload {
  DateTime date;
  String workoutType;
  List<ExerciseUpcoming> exercises;

  WorkOutUpcomingPayload({
    required this.date,
    required this.workoutType,
    required this.exercises,
  });

  @override
  String toString() {
    return 'WorkOutUpcomingPayload{date: $date, workoutType: $workoutType, exercises: $exercises}';
  }

  factory WorkOutUpcomingPayload.fromJson(Map<String, dynamic> json) {
    return WorkOutUpcomingPayload(
      date: DateTime.parse(json['date'] as String),
      workoutType: json['workoutType'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((exerciseJson) => ExerciseUpcoming.fromJson(exerciseJson))
          .toList(),
    );
  }
}

class ExerciseUpcoming {
  String displayName;
  num weight;
  int targetReps;
  int targetSets;

  ExerciseUpcoming({
    required this.displayName,
    required this.weight,
    required this.targetReps,
    required this.targetSets,
  });

  @override
  String toString() {
    return 'ExerciseUpcoming{displayName: $displayName, weight: $weight, targetReps: $targetReps, targetSets: $targetSets}';
  }

  factory ExerciseUpcoming.fromJson(Map<String, dynamic> json) {
    return ExerciseUpcoming(
      displayName: json['displayName'] as String,
      weight: json['weight'] as num,
      targetReps: json['targetReps'] as int,
      targetSets: json['targetSets'] as int,
    );
  }
}
