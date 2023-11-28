import 'package:flutter_learning_path/core/auth/auth_service.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/data/auth/auth_repository.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initServicesLocator() {
  // services
  getIt.registerLazySingleton<AuthService>(() => DefaultAuthService());
  getIt.registerLazySingleton<StorageService>(() => DefaultStorageService());

  // repositories
  getIt.registerLazySingleton<AuthRepository>(() => DefaultAuthRepository());
  getIt.registerLazySingleton<WorkOutRepository>(() => DefaultWorkOutRepository());
}
