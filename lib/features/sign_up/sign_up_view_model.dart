import 'package:dio/dio.dart';
import 'package:flutter_learning_path/common/logger.dart';
import 'package:flutter_learning_path/data/auth/auth_payload.dart';
import 'package:flutter_learning_path/data/auth/user_data_payload.dart';
import 'package:flutter_learning_path/features/sign_up/gender_picker.dart';
import 'package:flutter_learning_path/data/auth/auth_repository.dart';

class SignUpViewModel {
  final _authRepository = DefaultAuthRepository();

  Future<(bool isSuccess, String? errorText)> signUp({
    required String email,
    required String password,
    required GenderType? gender,
    required DateTime? dateOfBirth,
    required int height,
    required int weight,
  }) async {
    try {
      final userCredentials = AuthPayload(email, password);
      final signUpResponse = await _authRepository.signUpUser(userCredentials);

      final userData = UserDataPayload(
        signUpResponse.user.id,
        gender,
        dateOfBirth,
        height,
        weight,
      );
      await _authRepository.createUserDetails(
        userData,
        signUpResponse.accessToken,
      );
      return (true, null);
    } on DioException catch (e) {
      final message = e.response?.data['msg'] as String?;
      return (false, message);
    } catch (error) {
      logger.e(error);
      return (false, null);
    }
  }
}
