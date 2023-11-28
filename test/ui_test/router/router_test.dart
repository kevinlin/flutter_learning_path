import 'package:flutter_learning_path/core/auth/auth_service.dart';
import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/features/initial/initial_page.dart';
import 'package:flutter_learning_path/features/sign_in/sign_in_page.dart';
import 'package:flutter_learning_path/features/sign_up/sign_up_page.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_page.dart';
import 'package:flutter_learning_path/features/work_out/work_out_page.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../config/setup_service_locator.dart';
import '../../extensions/widget_tester_ext.dart';
import '../../mocks/nice_mocks.mocks.dart';

void main() {
  late MockAuthService authService;
  late MockStorageService storageService;

  setUpAll(() {
    setupServicesLocator();
    authService = getIt<AuthService>() as MockAuthService;
    storageService = getIt<StorageService>() as MockStorageService;
  });

  testWidgets('given invalid token, when InitialPage is requested, it renders InitialPage',
      (tester) async {
    when(storageService.readSecureData(any)).thenAnswer((_) => Future(() => ''));
    when(authService.isTokenValid(any)).thenReturn(false);

    await tester.pumpPageWidget(Routes.initial);

    expect(find.byType(InitialPage), findsOneWidget);
    expect(find.text("Keep track of your lifting goals"), findsOneWidget);
  });

  testWidgets('given invalid token, when SignInPage is requested, it renders SignInPage',
      (tester) async {
    when(storageService.readSecureData(any)).thenAnswer((_) => Future(() => ''));
    when(authService.isTokenValid(any)).thenReturn(false);

    await tester.pumpPageWidget(Routes.signIn);
    expect(find.byType(SignInPage), findsOneWidget);
  });

  testWidgets('given valid token, when SignUpPage is requested, it renders SignUpPage',
      (tester) async {
    when(storageService.readSecureData(any)).thenAnswer((_) => Future(() => 'token'));
    when(authService.isTokenValid(any)).thenReturn(true);

    await tester.pumpPageWidget(Routes.signUp);
    expect(find.byType(SignUpPage), findsOneWidget);
  });

  testWidgets('given invalid token, when UpcomingPage is requested, it renders InitialPage',
      (tester) async {
    when(storageService.readSecureData(any)).thenAnswer((_) => Future(() => 'token'));
    when(authService.isTokenValid(any)).thenReturn(false);

    await tester.pumpPageWidget(Routes.upcoming);
    expect(find.byType(InitialPage), findsOneWidget);
  });

  testWidgets('given valid token, when UpcomingPage is requested, it renders UpcomingPage',
      (tester) async {
    when(storageService.readSecureData(any)).thenAnswer((_) => Future(() => 'token'));
    when(authService.isTokenValid(any)).thenReturn(true);

    await tester.pumpPageWidget(Routes.upcoming);
    expect(find.byType(UpcomingPage), findsOneWidget);
  });

  testWidgets('given invalid token, when WorkoutPage is requested, it renders InitialPage',
      (tester) async {
    when(storageService.readSecureData(any)).thenAnswer((_) => Future(() => 'token'));
    when(authService.isTokenValid(any)).thenReturn(false);

    await tester.pumpPageWidget(Routes.workout);
    expect(find.byType(InitialPage), findsOneWidget);
  });

  testWidgets('given valid token, when WorkoutPage is requested, it renders WorkoutPage',
      (tester) async {
    when(storageService.readSecureData(any)).thenAnswer((_) => Future(() => 'token'));
    when(authService.isTokenValid(any)).thenReturn(true);

    await tester.pumpPageWidget(Routes.workout);
    expect(find.byType(WorkOutPage), findsOneWidget);
  });
}
