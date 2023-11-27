import 'package:flutter_learning_path/features/initial/initial_page.dart';
import 'package:flutter_learning_path/features/sign_in/sign_in_page.dart';
import 'package:flutter_learning_path/features/sign_up/sign_up_page.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.initial,
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
  ],
);
