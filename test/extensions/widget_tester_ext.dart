import 'package:flutter/material.dart';
import 'package:flutter_learning_path/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

var appTheme = ThemeData(
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
);

extension PumpApp on WidgetTester {
  /// **Purpose:** For testing widgets that are not pages
  ///
  /// **Limitation**: For simplicity, this WidgetTester method does not apply redirect logic,
  /// we recommend using `pumpPageWidget` if you need to test router redirection.
  ///
  /// **Example:** `pumpCustomWidget(SignUpForm())`
  ///
  /// **Note**: Optionally accepts a Riverpod container for state manipulation
  Future<void> pumpCustomWidget(Widget widget, {ProviderContainer? container}) async {
    await pumpWidget(
      UncontrolledProviderScope(
        container: container ?? ProviderContainer(),
        child: MaterialApp.router(
          theme: appTheme,
          routerConfig: createTestRouterConfig(widget),
        ),
      ),
    );
    await pumpAndSettle();
  }

  /// **Purpose**: For testing pages (also tests redirection behaviour)
  ///
  /// **Example**: `pumpPageWidget(Routes.workout)`
  ///
  /// **Note**: Optionally accepts a Riverpod container for state manipulation
  Future<void> pumpPageWidget(String location, {ProviderContainer? container}) async {
    await pumpWidget(
      UncontrolledProviderScope(
        container: container ?? ProviderContainer(),
        child: MaterialApp.router(
          theme: appTheme,
          routerConfig: createTestRouterConfigByLocation(location),
        ),
      ),
    );
    await pumpAndSettle();
  }
}
