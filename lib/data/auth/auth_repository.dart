import 'package:flutter_learning_path/common/http_client.dart';
import 'package:flutter_learning_path/common/logger.dart';
import 'package:flutter_learning_path/data/auth/auth_payload.dart';
import 'package:flutter_learning_path/data/auth/auth_response.dart';
import 'package:flutter_learning_path/data/auth/user_data_payload.dart';

abstract class AuthRepository {
  Future<AuthResponse> signUpUser(AuthPayload authPayload);

  Future<void> createUserDetails(UserDataPayload userData, String token);

  Future<String> signIn(AuthPayload authPayload);
}

class DefaultAuthRepository implements AuthRepository {
  @override
  Future<AuthResponse> signUpUser(AuthPayload authPayload) async {
    try {
      final response = await AppDio.auth().post('/auth/v1/signup', data: authPayload.toJson());
      return AuthResponse.fromJson(response.data);
    } catch (error) {
      logger.e(error);
      rethrow;
    }
  }

  @override
  Future<void> createUserDetails(UserDataPayload userData, String token) async {
    try {
      await AppDio.edge(token)
          .post('/user-data/${userData.id}', data: {"userData": userData.toJson()});
    } catch (error) {
      logger.e(error);
      rethrow;
    }
  }

  @override
  Future<String> signIn(AuthPayload authPayload) async {
    try {
      final response = await AppDio.auth().post(
        '/auth/v1/token?grant_type=password',
        data: authPayload.toJson(),
      );
      return AuthResponse.fromJson(response.data).accessToken;
    } catch (error) {
      logger.e(error);
      rethrow;
    }
  }
}
