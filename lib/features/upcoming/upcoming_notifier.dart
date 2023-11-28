import 'package:flutter_learning_path/constants/app_constants.dart';
import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpcomingNotifier extends Notifier<UpcomingState> {
  @override
  UpcomingState build() {
    return UpcomingState(
      workOutList: [],
    );
  }

  final _workOutRepository = getIt<WorkOutRepository>();
  final _storageService = getIt<StorageService>();

  Future<void> getWorkOut() async {
    try {
      state = state.copyWith(workOutList: await _workOutRepository.getWorkOutList());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    return _storageService.writeSecureData(StorageItem(AppConstants.TOKEN_KEY, ""));
  }
}

final $upcoming = NotifierProvider<UpcomingNotifier, UpcomingState>(() => UpcomingNotifier());
