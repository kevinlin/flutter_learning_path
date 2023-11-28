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

  testWidgets(
    'Given user taps back button, then they will go to upcoming page',
    (WidgetTester tester) async {
      await tester.pumpCustomWidget(WorkOutPage(), container: container);

      final backButton = find.byIcon(Icons.arrow_back);
      await tester.tap(backButton);
      await tester.pumpAndSettle();
      expect(find.byType(UpcomingPage), findsOneWidget);
    },
  );

  // custom predicates
  textContainsWaitFor(Widget widget) => widget is Text && widget.data?.contains('Wait for') == true;

  testWidgets(
    'Given a workoutPage with exercises and user does not make any interactions, then it should not show any timer text',
    (WidgetTester tester) async {
      await tester.pumpCustomWidget(WorkOutPage(), container: container);

      expect(find.byWidgetPredicate(textContainsWaitFor), findsNothing);
    },
  );

  testWidgets(
    'Given a workoutPage with exercises and user taps first rep, then it should show the correct timer text, and when we wait 1 second then wait time text decreases by 1 second',
    (WidgetTester tester) async {
      await tester.pumpCustomWidget(WorkOutPage(), container: container);

      await tester.tap(find.text("5").first);
      await tester.pump(Duration(seconds: 1));
      await tester.screenshot();
      expect(find.text("Wait for 3 : 00"), findsOneWidget);

      await tester.pump(Duration(seconds: 1));
      await tester.screenshot();
      expect(find.text("Wait for 2 : 59"), findsOneWidget);
    },
  );

  testWidgets(
    'Given a workoutPage with exercises and user taps first rep, then it should show the correct timer text, and when we wait 3 mins then timer text should disappear',
    (WidgetTester tester) async {
      await tester.pumpCustomWidget(WorkOutPage(), container: container);

      await tester.tap(find.text("5").first);
      await tester.pump(Duration(seconds: 1));

      final wait3MinFinder = find.text("Wait for 3 : 00");
      expect(wait3MinFinder, findsOneWidget);

      await tester.pump(Duration(seconds: 180));
      // Checking for any text with "Wait for"
      final countdownDisplayTextFinder = find.byWidgetPredicate(textContainsWaitFor);
      expect(countdownDisplayTextFinder, findsNothing);
    },
  );
}
