import 'package:flutter/material.dart';
import 'package:flutter_learning_path/common/snack_bar.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_notifier.dart';
import 'package:flutter_learning_path/features/work_out/countdown_display.dart';
import 'package:flutter_learning_path/features/work_out/exercise_row.dart';
import 'package:flutter_learning_path/features/work_out/timer_notifier.dart';
import 'package:flutter_learning_path/features/work_out/work_out_notifier.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:flutter_learning_path/styling/text_styling_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkOutPage extends ConsumerStatefulWidget {
  const WorkOutPage({super.key});

  @override
  ConsumerState createState() => _WorkOutPageState();
}

class _WorkOutPageState extends ConsumerState<WorkOutPage> {
  late TimerNotifier timerNotifier;

  @override
  void initState() {
    super.initState();
    timerNotifier = ref.read($timer.notifier);
    Future.microtask(() {
      timerNotifier.createTimer();
    });
  }

  @override
  void dispose() {
    timerNotifier.destroyTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workout = ref.watch($workout.select((value) => value.workOut));
    final isSubmitting = ref.watch($workout.select((value) => value.isSubmitting));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () async {
                ref.read($timer.notifier).stopCountdown();
                final isSuccess = await ref.read($workout.notifier).submitWorkOut();
                if (isSuccess) {
                  await ref.read($upcoming.notifier).getWorkOut();
                  if (mounted) {
                    context.go(Routes.upcoming);
                  }
                } else {
                  if (mounted) {
                    showSnackBar(context, 'Failed to update exercise record.');
                  }
                }
              },
              child: Text('Finish', style: Theme.of(context).textTheme.bodyLarge?.withColorRed),
            ),
          )
        ],
        leading: IconButton(
            icon: const Icon(Icons.arrow_back), onPressed: () => context.go(Routes.upcoming)),
        title: Text("Workout ${workout.workoutType}",
            style: Theme.of(context).textTheme.headlineSmall),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: isSubmitting
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: workout.exercises.length,
                itemBuilder: (context, index) {
                  return ExercisesRow(exerciseIndex: index);
                },
              ),
            ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: CountdownDisplay(),
      ),
    );
  }
}
