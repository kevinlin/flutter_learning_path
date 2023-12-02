import 'package:flutter/material.dart';
import 'package:flutter_learning_path/main.dart';
import 'package:flutter_learning_path/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../config/setup_dimentions.dart';

extension PumpApp on WidgetTester {
  /// **Purpose:** For testing widgets that are not pages
  ///
  /// **Example:** `pumpCustomWidget(SignUpForm())`
  ///
  /// **Note**: Optionally accepts a Riverpod container for state manipulation
  ///
  /// **Limitation**: Redirect logic might cause unexpected behaviour during navigation,
  /// we recommend using `pumpPageWidget` if you need to test for redirect correctness
  Future<void> pumpCustomWidget(
    Widget widget, {
    ProviderContainer? container,
  }) async {
    await setupDimensions(this);
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
    await _primeAssets(this);
    await screenshot();
  }

  /// **Purpose**: For testing pages
  ///
  /// **Example**: `pumpPageWidget(Routes.workout)`
  ///
  /// **Note**: Optionally accepts a Riverpod container for state manipulation
  Future<void> pumpPageWidget(
    String location, {
    ProviderContainer? container,
  }) async {
    await setupDimensions(this);
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
    await _primeAssets(this);
    await screenshot();
  }

  static int screenshotCount = 1;
  static String tempTestDescription = "";

  Future<void> screenshot() async {
    if (tempTestDescription != testDescription) {
      tempTestDescription = testDescription;
      screenshotCount = 1;
    }

    if (screenshotCount == 1) {
      // ignore: avoid_print
      print("\nScreenshots generated if --update-goldens is used\n\n");
    }

    final countSuffix = '-ss$screenshotCount';

    // so that folders are not created if the test description has slashes
    final updatedTaskDescription = testDescription.replaceAll("/", "-");

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/$updatedTaskDescription$countSuffix.png'),
    ).onError((error, stackTrace) {
      // this prevents test error if --update-goldens is not used
    });
    screenshotCount += 1;
  }

  /// ensures images will be shown in screenshots
  Future<void> _primeAssets(WidgetTester tester) async {
    final imageElements = find.byType(Image, skipOffstage: false).evaluate();
    final decoratedBoxElements = find.byType(DecoratedBox, skipOffstage: false).evaluate();

    if (imageElements.isEmpty && decoratedBoxElements.isEmpty) {
      return;
    }

    await tester.runAsync(() async {
      for (final imageElement in imageElements) {
        final widget = imageElement.widget;
        if (widget is Image) {
          await precacheImage(widget.image, imageElement);
          await tester.pump();
        }
      }
      for (final decoratedBox in decoratedBoxElements) {
        final widget = decoratedBox.widget as DecoratedBox;
        final decoration = widget.decoration;
        if (decoration is BoxDecoration) {
          if (decoration.image != null) {
            await precacheImage(decoration.image!.image, decoratedBox);
            await tester.pump();
          }
        }
      }
    });
  }
}
