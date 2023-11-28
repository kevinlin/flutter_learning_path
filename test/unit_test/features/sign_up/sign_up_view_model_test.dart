import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/data/auth/auth_repository.dart';
import 'package:flutter_learning_path/data/auth/auth_response.dart';
import 'package:flutter_learning_path/features/sign_up/gender_picker.dart';
import 'package:flutter_learning_path/features/sign_up/sign_up_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../config/setup_service_locator.dart';
import '../../../mocks/nice_mocks.mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late SignUpViewModel signUpViewModel;

  setUpAll(() {
    setupServicesLocator();
    authRepository = getIt<AuthRepository>() as MockAuthRepository;
    signUpViewModel = SignUpViewModel();
  });

  test('Sign up successfully', () async {
    // given
    when(authRepository.signUpUser(any)).thenAnswer(
        (_) => Future(() => AuthResponse(accessToken: 'accessToken', user: User(id: 'id'))));
    when(authRepository.createUserDetails(any, any)).thenAnswer((_) => Future(() => null));

    // when
    final (isSuccess, errorText) = await signUpViewModel.signUp(
      email: 'email',
      password: 'password',
      gender: GenderType.FEMALE,
      dateOfBirth: DateTime.now(),
      height: 160,
      weight: 50,
    );

    // then
    expect(isSuccess, true);
    expect(errorText, null);
    verify(authRepository.createUserDetails(any, any)).called(1);
  });

  test('Sign up - createUserDetails throw error', () async {
    // given
    when(authRepository.signUpUser(any)).thenAnswer(
        (_) => Future(() => AuthResponse(accessToken: 'accessToken', user: User(id: 'id'))));
    when(authRepository.createUserDetails(any, any))
        .thenThrow(Exception('Failed to create user details'));

    // when
    final (isSuccess, errorText) = await signUpViewModel.signUp(
      email: 'email',
      password: 'password',
      gender: GenderType.FEMALE,
      dateOfBirth: DateTime.now(),
      height: 160,
      weight: 50,
    );

    // then
    expect(isSuccess, false);
    expect(errorText, null);
    verify(authRepository.createUserDetails(any, any)).called(1);
  });

  test('Sign up - signUpUser throw error', () async {
    // given
    when(authRepository.signUpUser(any)).thenThrow(Exception('Failed to create user details'));

    // when
    final (isSuccess, errorText) = await signUpViewModel.signUp(
      email: 'email',
      password: 'password',
      gender: GenderType.FEMALE,
      dateOfBirth: DateTime.now(),
      height: 160,
      weight: 50,
    );

    // then
    expect(isSuccess, false);
    expect(errorText, null);
    verifyNever(authRepository.createUserDetails(any, any));
  });
}
