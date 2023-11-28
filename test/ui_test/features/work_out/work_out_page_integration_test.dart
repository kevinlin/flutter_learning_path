import 'package:flutter/material.dart';
import 'package:flutter_learning_path/core/auth/auth_service.dart';
import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_card.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_notifier.dart';
import 'package:flutter_learning_path/features/work_out/timer_notifier.dart';
import 'package:flutter_learning_path/features/work_out/work_out_notifier.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../config/setup_service_locator.dart';
import '../../../extensions/widget_tester_ext.dart';
import '../../../mocks/nice_mocks.mocks.dart';

void main() {
  group(
      "Given user is on WorkOutPage and clicks on ExerciseButton, this triggers timer. When user goes back timer stops counting, and when user revisits the page timer continues with the correct time",
      () {
    late ProviderContainer container;
    late MockAuthService authService;
    late MockStorageService storageService;
    late MockWorkOutRepository workOutRepository;

    setUpAll(() {
      setupServicesLocator();
      authService = getIt<AuthService>() as MockAuthService;
      storageService = getIt<StorageService>() as MockStorageService;
      workOutRepository = getIt<WorkOutRepository>() as MockWorkOutRepository;
    });

    setUp(() {
      container = ProviderContainer();

      final exercises = [
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
      ];

      when(workOutRepository.getWorkOutList()).thenAnswer(
        (_) async => [
          WorkOutUpcomingPayload(
              date: DateTime.now(), exercises: exercises, workoutType: "Workout A"),
        ],
      );

      container.read($upcoming.notifier).getWorkOut();

      final workOut =
          WorkOutUpcomingPayload(date: DateTime.now(), workoutType: "A", exercises: exercises);

      container.read($workout.notifier).setWorkOut(workOut);
    });

    // custom predicates
    textContainsWaitFor(Widget widget) =>
        widget is Text && widget.data?.contains('Wait for') == true;

    final durations = [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
      Duration(seconds: 180),
    ];
    for (final inputDuration in durations) {
      testWidgets(
        'User has waited ${inputDuration.inSeconds} before returning to WorkOutPage',
        (WidgetTester tester) async {
          when(storageService.readSecureData(any)).thenAnswer((_) async => 'token');
          when(authService.isTokenValid(any)).thenReturn(true);

          // when user is on WorkOutPage
          await tester.pumpPageWidget(Routes.workout, container: container);

          // when user taps ExerciseButton
          await tester.tap(find.text("5").first);
          await tester.pump(Duration(seconds: 1));
          expect(find.text("Wait for 3 : 00"), findsOneWidget);

          final secondsLeftBeforeNav = container.read($timer.notifier).state.secondsLeft;

          // when user taps nav back
          await tester.tap(find.byIcon(Icons.arrow_back));
          await tester.pumpAndSettle();

          // when user waits for x seconds before navigating back
          await tester.pump(inputDuration);

          // when user taps nav to UpcomingPage
          await tester.tap(find.byType(UpcomingCard).first);
          await tester.pumpAndSettle();

          final countdownDisplayTextFinder = find.byWidgetPredicate(textContainsWaitFor);

          // Then
          switch (inputDuration.inSeconds) {
            case 0:
              {
                expect(find.text("Wait for 3 : 00"), findsOneWidget);
              }
            case 180:
              {
                expect(find.text("Wait for 3 : 00"), findsNothing);
                expect(countdownDisplayTextFinder, findsNothing);
              }
            default:
              {
                expect(find.text("Wait for 3 : 00"), findsNothing);
                expect(countdownDisplayTextFinder, findsOneWidget);

                final secondsAfterNav = container.read($timer.notifier).state.secondsLeft;
                assert(secondsLeftBeforeNav - secondsAfterNav >= inputDuration.inSeconds,
                    "secondsLeft has changed by at least ${inputDuration.inSeconds} seconds");
              }
          }
        },
      );
    }
  });
}
