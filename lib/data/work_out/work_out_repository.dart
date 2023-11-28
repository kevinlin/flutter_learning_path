import 'package:flutter_learning_path/common/http_client.dart';
import 'package:flutter_learning_path/common/logger.dart';
import 'package:flutter_learning_path/data/work_out/work_out_history_payload.dart';
import 'package:flutter_learning_path/data/work_out/work_out_upcoming_payload.dart';
import 'package:flutter_learning_path/constants/app_constants.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';

abstract class WorkOutRepository {
  Future<List<WorkOutUpcomingPayload>> getWorkOutList();

  Future<void> submitWorkOut(WorkOutHistoryPayload history);
}

class DefaultWorkOutRepository implements WorkOutRepository {
  @override
  Future<List<WorkOutUpcomingPayload>> getWorkOutList() async {
    final token = await _getToken();

    try {
      final response = await AppDio.edge(token).get('/workouts-upcoming');
      return response.data
          .map<WorkOutUpcomingPayload>((workOut) => WorkOutUpcomingPayload.fromJson(workOut))
          .toList();
    } catch (error) {
      logger.d(error);
      rethrow;
    }
  }

  @override
  Future<void> submitWorkOut(WorkOutHistoryPayload history) async {
    final token = await _getToken();

    try {
      await AppDio.edge(token).post('/workouts-history', data: history.toJson());
    } catch (error) {
      logger.d(error);
      rethrow;
    }
  }

  Future<String> _getToken() async {
    final storageService = DefaultStorageService();
    return await storageService.readSecureData(AppConstants.TOKEN_KEY) ?? "";
  }
}
