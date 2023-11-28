import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_learning_path/constants/app_constants.dart';
import 'package:flutter_learning_path/core/auth/auth_service.dart';
import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/features/sign_in/sign_in_page.dart';
import 'package:flutter_learning_path/features/initial/initial_page.dart';
import 'package:flutter_learning_path/features/sign_up/sign_up_page.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_page.dart';
import 'package:flutter_learning_path/features/work_out/work_out_page.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:go_router/go_router.dart';

// global variable router used in main.dart
final router = GoRouter(
  initialLocation: Routes.initial,
  redirect: _redirect,
  routes: _goRoutes,
);

/// Only used in tests, see widget_test_ext.dart
/// For simplicity, this configuration does not apply redirect behaviour
GoRouter createTestRouterConfig(Widget testWidget) {
  return GoRouter(
    initialLocation: '/test',
    redirect: null,
    routes: [
      GoRoute(
        path: '/test',
        builder: (context, state) => testWidget,
      ),
      ..._goRoutes,
    ],
  );
}

/// Only used in tests, see widget_test_ext.dart
/// Matches the real implementation of router, but enables the developer to configure the initial location
GoRouter createTestRouterConfigByLocation(String location) {
  return GoRouter(
    initialLocation: location,
    redirect: _redirect,
    routes: [
      ..._goRoutes,
    ],
  );
}

FutureOr<String?> Function(BuildContext, GoRouterState)? _redirect =
    (BuildContext context, GoRouterState state) async {
  final storageService = getIt<StorageService>();
  final authService = getIt<AuthService>();

  final token = await storageService.readSecureData(AppConstants.TOKEN_KEY);
  final isTokenValid = authService.isTokenValid(token ?? "");

  final bool goingToInitialPage = state.matchedLocation == Routes.initial;
  final bool goingToSignInPage = state.matchedLocation == Routes.signIn;
  final bool goingToSignUpPage = state.matchedLocation == Routes.signUp;

  // Note: return null means no redirect, and go to requested page.
  if (goingToSignInPage || goingToSignUpPage) {
    return null;
  } else if (isTokenValid && goingToInitialPage) {
    return Routes.upcoming;
  } else if (token == null || isTokenValid == false) {
    return Routes.initial;
  }
  return null;
};

final _goRoutes = [
  GoRoute(
    path: Routes.initial,
    builder: (context, state) => InitialPage(),
  ),
  GoRoute(
    path: Routes.signIn,
    builder: (context, state) => SignInPage(),
  ),
  GoRoute(
    path: Routes.signUp,
    builder: (context, state) => SignUpPage(),
  ),
  GoRoute(
    path: Routes.upcoming,
    builder: (context, state) => UpcomingPage(),
  ),
  GoRoute(
    path: Routes.workout,
    builder: (context, state) => WorkOutPage(),
  ),
];
