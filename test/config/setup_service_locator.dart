import 'package:flutter_learning_path/core/auth/auth_service.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/data/auth/auth_repository.dart';
import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';

import '../mocks/nice_mocks.mocks.dart';

void setupServicesLocator() {
  getIt.allowReassignment = true;

  // Register mock services that need to be stubbed
  getIt.registerLazySingleton<AuthRepository>(() => MockAuthRepository());
  getIt.registerLazySingleton<StorageService>(() => MockStorageService());
  getIt.registerLazySingleton<WorkOutRepository>(() => MockWorkOutRepository());
  getIt.registerLazySingleton<AuthService>(() => MockAuthService());

  /*  You can also set default stubs for services in this file.

      Let's imagine there is a `NetworkInfo` class, and that we have generated nice mocks for `NetworkInfo`
      We can create a variable `mockConnectivity`, then register this with getIt, and then stub the method.
  */

  // final mockConnectivity = MockConnectivity();

  // getIt.registerLazySingleton<NetworkInfo>(
  //         () => DefaultNetworkInfo(mockConnectivity));

  // when(mockConnectivity.checkConnectivity())
  //     .thenAnswer((_) async => ConnectivityResult.wifi);
}
