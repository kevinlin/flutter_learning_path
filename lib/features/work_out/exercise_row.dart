import 'package:flutter/material.dart';
import 'package:flutter_learning_path/features/work_out/exercise_button.dart';
import 'package:flutter_learning_path/features/work_out/work_out_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExercisesRow extends ConsumerWidget {
  const ExercisesRow({super.key, required this.exerciseIndex});

  final int exerciseIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercise = ref.watch($workout.select((value) => value.workOut.exercises[exerciseIndex]));

    final exerciseRecord =
        ref.watch($workout.select((value) => value.exerciseRecords[exerciseIndex]));

    return SizedBox(
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(exercise.displayName, style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  '${exercise.targetSets}x${exercise.targetReps} ${exercise.weight}kg',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: exercise.targetSets,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, setIndex) {
                    final currentReps = exerciseRecord.completedReps[setIndex];
                    return ExerciseButton(
                      currentReps: currentReps,
                      targetReps: exercise.targetReps,
                      handlePress: () {
                        final updatedCount = getUpdatedCount(currentReps, exercise.targetReps);
                        ref
                            .read($workout.notifier)
                            .updateExerciseRecord(exerciseIndex, setIndex, updatedCount);
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  int? getUpdatedCount(int? currentReps, int targetReps) {
    if (currentReps == null) {
      return targetReps;
    } else if (currentReps > 0) {
      return currentReps - 1;
    } else {
      return null;
    }
  }
}
