import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learning_path/common/snack_bar.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_card.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_notifier.dart';
import 'package:flutter_learning_path/features/work_out/work_out_notifier.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:flutter_learning_path/styling/text_styling_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpcomingPage extends HookConsumerWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutList = ref.watch($upcoming.select((value) => value.workOutList));

    Future<void> fetchData() async {
      try {
        Future.microtask(() async => await ref.read($upcoming.notifier).getWorkOut());
      } catch (e) {
        // if you want to test the error, deliberately change the path of getWorkOutList
        // in WorkOutRepository to something different to '/workouts-upcoming'
        if (context.mounted) {
          showSnackBar(context, 'Error retrieving workout data', Colors.red);
        }
      }
    }

    useEffect(() {
      fetchData();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              await ref.watch($upcoming.notifier).signOut();
              if (context.mounted) {
                context.go(Routes.initial);
              }
            },
            child: Text('Sign out', style: Theme.of(context).textTheme.bodyLarge?.withColorRed),
          )
        ],
        title: Image.asset("assets/images/logo.png", height: 35),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: ListView.builder(
        itemCount: workoutList.length,
        itemBuilder: (context, index) {
          final workout = workoutList[index];
          return GestureDetector(
              onTap: index == 0
                  ? () {
                      ref.read($workout.notifier).setWorkOut(workout);
                      context.push(Routes.workout);
                    }
                  : null,
              child: UpcomingCard(workout: workout));
        },
      ),
    );
  }
}
