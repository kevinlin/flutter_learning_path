import 'package:flutter_learning_path/features/initial/InitialPage.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.initial,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => InitialPage(),
    ),
  ],
);
