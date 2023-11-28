import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../config/setup_service_locator.dart';
import '../../../mocks/nice_mocks.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockWorkOutRepository workOutRepository;
  late MockStorageService storageService;

  setUpAll(() {
    setupServicesLocator();
    workOutRepository = getIt<WorkOutRepository>() as MockWorkOutRepository;
    storageService = getIt<StorageService>() as MockStorageService;
  });

  setUp(() => container = ProviderContainer());

  test('GetWorkOut successfully', () async {
    // given
    when(workOutRepository.getWorkOutList()).thenAnswer(
      (_) => Future(() => [
            WorkOutUpcomingPayload(date: DateTime.now(), workoutType: 'Workout Type A', exercises: [
              ExerciseUpcoming(displayName: 'displayName', weight: 50, targetReps: 5, targetSets: 5)
            ])
          ]),
    );

    // when
    await container.read($upcoming.notifier).getWorkOut();

    // then
    expect(container.read($upcoming).workOutList.length, 1);
    verify(workOutRepository.getWorkOutList()).called(1);
  });

  test('GetWorkOut failed', () async {
    // given
    when(workOutRepository.getWorkOutList()).thenThrow(Exception('Failed to call getWorkOutList'));

    // when
    bool error = false;
    try {
      await container.read($upcoming.notifier).getWorkOut();
    } catch (e) {
      error = true;
    }

    // then
    expect(error, true);
    expect(container.read($upcoming).workOutList.length, 0);
    verify(workOutRepository.getWorkOutList()).called(1);
  });

  test('Sign out successfully', () async {
    // when
    await container.read($upcoming.notifier).signOut();

    // then
    verify(storageService.writeSecureData(any)).called(1);
  });
}
