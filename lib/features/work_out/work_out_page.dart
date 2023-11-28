import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final workout = ref.watch($workout.select((value) => value.workOut));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () async {
                // TODO in a later section
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: workout.exercises.length,
          itemBuilder: (context, index) {
            return Text(workout.exercises[index].toString());
          },
        ),
      ),
    );
  }
}
