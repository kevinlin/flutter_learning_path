import 'package:flutter/cupertino.dart';
import 'package:flutter_learning_path/constants/app_constants.dart';
import 'package:flutter_learning_path/core/auth/auth_service.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/features/initial/initial_page.dart';
import 'package:flutter_learning_path/features/sign_in/sign_in_page.dart';
import 'package:flutter_learning_path/features/sign_up/sign_up_page.dart';
import 'package:flutter_learning_path/features/upcoming/upcoming_page.dart';
import 'package:flutter_learning_path/features/work_out/work_out_page.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.initial,
  redirect: (BuildContext context, GoRouterState state) async {
    final storageService = DefaultStorageService();
    final authService = DefaultAuthService();

    final token = await storageService.readSecureData(AppConstants.TOKEN_KEY);
    final isTokenValid = authService.isTokenValid(token ?? "");

    final bool goingToInitialPage = state.matchedLocation == Routes.initial;
    final bool goingToSignInPage = state.matchedLocation == Routes.signIn;
    final bool goingToSignUpPage = state.matchedLocation == Routes.signUp;

    if (goingToSignInPage || goingToSignUpPage) {
      return null; // no redirect at all
    } else if (isTokenValid && goingToInitialPage) {
      return Routes.upcoming;
    } else if (token == null || isTokenValid == false) {
      return Routes.initial;
    }
    return null; // no redirect at all
  },
  routes: [
    GoRoute(
      path: Routes.initial,
      builder: (context, state) => InitialPage(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: Routes.upcoming,
      builder: (context, state) => UpcomingPage(),
    ),
    GoRoute(
      path: Routes.workout,
      builder: (context, state) => WorkOutPage(),
    ),
  ],
);
