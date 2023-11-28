import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:flutter_learning_path/features/work_out/work_out_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../config/setup_service_locator.dart';
import '../../../mocks/nice_mocks.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockWorkOutRepository workOutRepository;

  setUpAll(() {
    setupServicesLocator();
    workOutRepository = getIt<WorkOutRepository>() as MockWorkOutRepository;
  });

  setUp(() => container = ProviderContainer());

  test('setWorkout successfully', () async {
    // given
    final payload = WorkOutUpcomingPayload(
      date: DateTime.now(),
      workoutType: 'Workout type A',
      exercises: [
        ExerciseUpcoming(displayName: "displayName", weight: 50, targetReps: 20, targetSets: 20)
      ],
    );

    // when
    container.read($workout.notifier).setWorkOut(payload);

    // then
    expect(container.read($workout).workOut, payload);
  });

  test('submitWorkout successfully', () async {
    // given
    when(workOutRepository.submitWorkOut(any)).thenAnswer((_) => Future(() => null));

    // when
    final result = await container.read($workout.notifier).submitWorkOut();

    // then
    expect(result, true);
    verify(workOutRepository.submitWorkOut(any)).called(1);
  });

  test('submitWorkout failed', () async {
    // given
    when(workOutRepository.submitWorkOut(any))
        .thenThrow(Exception('Failed to call submit workout.'));

    // when
    final result = await container.read($workout.notifier).submitWorkOut();

    // then
    expect(result, false);
    verify(workOutRepository.submitWorkOut(any)).called(1);
  });
}
