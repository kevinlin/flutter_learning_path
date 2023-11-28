import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // We could add things like, and then we don't need to write in our test files
    // setupServicesLocator();

    // Load assets in UI tests (to improve test screenshots)
    // TODO setupTextFont
    // TODO setupIconFont
  });

  tearDown(() {
    resetMockitoState();
  });

  await testMain();
}
