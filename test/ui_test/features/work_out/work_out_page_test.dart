import 'package:flutter/material.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_page.dart';
import 'package:flutter_learning_path/features/work_out/work_out_notifier.dart';
import 'package:flutter_learning_path/features/work_out/work_out_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../config/setup_service_locator.dart';
import '../../../extensions/widget_tester_ext.dart';

void main() {
  late ProviderContainer container;

  setUpAll(() {
    setupServicesLocator();
  });

  setUp(() {
    container = ProviderContainer();

    final workOut = WorkOutUpcomingPayload(
      date: DateTime.now(),
      workoutType: "A",
      exercises: [
        ExerciseUpcoming(
          displayName: "Squat",
          weight: 20,
          targetReps: 5,
          targetSets: 5,
        ),
        ExerciseUpcoming(
          displayName: "Overhead Press",
          weight: 20,
          targetReps: 5,
          targetSets: 5,
        ),
        ExerciseUpcoming(
          displayName: "Deadlift",
          weight: 20,
          targetReps: 5,
          targetSets: 5,
        ),
      ],
    );

    container.read($workout.notifier).setWorkOut(workOut);
  });

  testWidgets('Given user taps back button, then they will go to upcoming page', (WidgetTester tester) async {
      await tester.pumpCustomWidget(WorkOutPage(), container: container);

      final backButton = find.byIcon(Icons.arrow_back);
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      expect(find.byType(UpcomingPage), findsOneWidget);
    },
  );
}
