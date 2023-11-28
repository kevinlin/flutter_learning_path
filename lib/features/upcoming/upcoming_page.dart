import 'package:flutter/material.dart';
import 'package:flutter_learning_path/common/snack_bar.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_card.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_notifier.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:flutter_learning_path/styling/text_styling_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UpcomingPage extends ConsumerStatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends ConsumerState<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    final workoutList = ref.watch($upcoming.select((value) => value.workOutList));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              await ref.watch($upcoming.notifier).signOut();
              // need to check mounted because we need to use context inside an async method
              if (mounted) {
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
          var workout = workoutList[index];
          return new UpcomingCard(workout: workout);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Fetch data from backend
  Future<void> fetchData() async {
    try {
      await ref.read($upcoming.notifier).getWorkOut();
    } catch (e) {
      // if you want to test the error, deliberately change the path of getWorkOutList in WorkOutRepository to something different to '/workouts-upcoming'
      if (mounted) {
        showSnackBar(context, 'Error retrieving workout data', Colors.red);
      }
    }
  }
}
