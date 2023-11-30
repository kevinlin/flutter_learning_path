import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../config/setup_service_locator.dart';
import '../../../extensions/widget_tester_ext.dart';
import '../../../mocks/nice_mocks.mocks.dart';

void main() {
  late MockWorkOutRepository workOutRepository;

  DateTime customTime = DateTime(2023, 7, 18);

  final upcomingWorkouts = [
    WorkOutUpcomingPayload(
      date: customTime,
      workoutType: "A",
      exercises: [
        ExerciseUpcoming(displayName: "Squat", weight: 20, targetReps: 4, targetSets: 4),
        ExerciseUpcoming(displayName: "Overhead Press", weight: 25, targetReps: 5, targetSets: 5),
        ExerciseUpcoming(
          displayName: "Deadlift",
          weight: 30,
          targetReps: 6,
          targetSets: 6,
        ),
      ],
    ),
    WorkOutUpcomingPayload(
      date: customTime.add(Duration(days: 2)),
      workoutType: "B",
      exercises: [
        ExerciseUpcoming(displayName: "Squat", weight: 35, targetReps: 7, targetSets: 7),
        ExerciseUpcoming(displayName: "Bench Press", weight: 40, targetReps: 8, targetSets: 8),
        ExerciseUpcoming(displayName: "Bent Over Row", weight: 45, targetReps: 9, targetSets: 9),
      ],
    )
  ];

  setUpAll(() {
    setupServicesLocator();
    workOutRepository = getIt<WorkOutRepository>() as MockWorkOutRepository;
  });

  setUp(() {
    when(workOutRepository.getWorkOutList()).thenAnswer(
      (_) => Future.value(upcomingWorkouts),
    );
  });

  // custom predicates
  textContainsWorkout(Widget widget) => widget is Text && widget.data?.contains('Workout') == true;

  testWidgets(
    "Given the workout repo returns today's workout and next workout, when user visits UpcomingPage, then it should display the two upcoming workouts",
    (WidgetTester tester) async {
      await withClock(
        Clock.fixed(customTime),
        () async => await tester.pumpCustomWidget(UpcomingPage()),
      );

      expect(find.byWidgetPredicate(textContainsWorkout), findsNWidgets(2));
      expect(find.text("Today"), findsOneWidget);
      expect(find.text("20/07/2023"), findsOneWidget);

      expect(find.text("Squat"), findsNWidgets(2));
      expect(find.text("4x4 20kg"), findsOneWidget);
      expect(find.text("7x7 35kg"), findsOneWidget);

      expect(find.text("Overhead Press"), findsOneWidget);
      expect(find.text("5x5 25kg"), findsOneWidget);

      expect(find.text("Deadlift"), findsOneWidget);
      expect(find.text("6x6 30kg"), findsOneWidget);

      expect(find.text("Bench Press"), findsOneWidget);
      expect(find.text("8x8 40kg"), findsOneWidget);

      expect(find.text("Bent Over Row"), findsOneWidget);
      expect(find.text("9x9 45kg"), findsOneWidget);
    },
  );
}
