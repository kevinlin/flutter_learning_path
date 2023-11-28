import 'package:flutter_learning_path/common/logger.dart';
import 'package:flutter_learning_path/constants/app_constants.dart';
import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/data/auth/auth_payload.dart';
import 'package:flutter_learning_path/data/auth/auth_repository.dart';

class SignInViewModel {
  final _authRepository = getIt<AuthRepository>();
  final _storageService = getIt<StorageService>();

  Future<bool> login(String email, String password) async {
    final payload = AuthPayload(email, password);
    
    try {
      final token = await _authRepository.signIn(payload);
      _storageService.writeSecureData(StorageItem(AppConstants.TOKEN_KEY, token));
      return true;
    } catch (error) {
      // generic catch here, and no DioError handling because API does not
      // provide any detailed messages in `e.response?.data['msg']`
      logger.e(error);
      return false;
    }
  }
}
