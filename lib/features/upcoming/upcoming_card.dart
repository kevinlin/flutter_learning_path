import 'package:flutter/material.dart';
import 'package:flutter_learning_path/common/date_time_extension.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class UpcomingCard extends ConsumerWidget {
  const UpcomingCard({
    super.key,
    required this.workout,
  });

  final WorkOutUpcomingPayload workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseList = workout.exercises;
    return Card(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Workout ${workout.workoutType}",
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  workout.date.isToday() ? 'Today' : DateFormat('dd/MM/yyyy').format(workout.date),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: exerciseList.length,
              itemBuilder: (context, index) {
                final exercise = exerciseList[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(exercise.displayName, style: Theme.of(context).textTheme.bodyLarge),
                    Text('${exercise.targetSets}x${exercise.targetReps} ${exercise.weight}kg',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
