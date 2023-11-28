import 'package:flutter/material.dart';
import 'package:flutter_learning_path/core/service_locator.dart';
import 'package:flutter_learning_path/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServicesLocator();
  runApp(
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          background: Colors.grey.shade800,
          seedColor: Colors.red,
          onSurface: Colors.white,
        ),
        textTheme: TextTheme(
          // headlineLarge: TextStyle(color: Colors.red), // unused
          // headlineMedium: TextStyle(color: Colors.red), // unused
          headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          // titleLarge: TextStyle(color: Colors.red), // unused
          titleMedium: TextStyle(color: Colors.red),
          // titleSmall: TextStyle(color: Colors.red), // unused
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          // labelLarge: TextStyle(), // unused
          labelMedium: TextStyle(color: Colors.grey),
          labelSmall: TextStyle(color: Colors.red),
        ),
        cardColor: Colors.white30,
        iconTheme: IconThemeData(color: Colors.white),
        datePickerTheme: DatePickerThemeData(
          yearForegroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
          yearStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
