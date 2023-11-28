import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/data/auth/auth_repository.dart';
import 'package:flutter_learning_path/features/sign_in/sign_in_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/nice_mocks.mocks.dart';
import '../../../config/setup_service_locator.dart';

void main() {
  late MockAuthRepository authRepository;
  late MockStorageService storageService;
  late SignInViewModel signInViewModel;

  setUpAll(() async {
    setupServicesLocator();
    storageService = getIt<StorageService>() as MockStorageService;
    authRepository = getIt<AuthRepository>() as MockAuthRepository;
    // note above we need to do type casting (as xx) to provide us with better auto-complete in the tests

    // the class under test
    signInViewModel = SignInViewModel();
  });

  test('Login successfully', () async {
    // given - auth signIn returns token
    when(authRepository.signIn(any)).thenAnswer((_) async => Future(() => 'token'));

    // when - signInViewModel login is called
    final result = await signInViewModel.login('test@mail.com', 'password');

    // then below
    expect(result, true);
    verify(storageService.writeSecureData(any)).called(1);
    verify(authRepository.signIn(any)).called(1);
  });

  test('Login failed', () async {
    // given - auth signIn throws exception
    when(authRepository.signIn(any)).thenThrow(Exception('Failed to login'));

    // when - signInViewModel login is called
    final result = await signInViewModel.login('test@mail.com', 'password');

    // then below
    expect(result, false);
    verify(authRepository.signIn(any)).called(1);
    verifyNever(storageService.writeSecureData(any));
  });
}
