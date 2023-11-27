import 'package:dio/dio.dart';
import 'package:flutter_learning_path/constants/env_constants.dart';

class AppDio {
  // prevent instantiation
  AppDio._();

  static Dio auth() {
    return Dio(
      BaseOptions(
        baseUrl: Constants.supabaseServicesUrl,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'apiKey': Constants.supabaseAnonKey,
        },
      ),
    );
  }

  static Dio edge(String token) {
    return Dio(
      BaseOptions(
        baseUrl: Constants.supabaseEdgeUrl,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}
