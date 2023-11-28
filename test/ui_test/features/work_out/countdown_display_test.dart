import 'package:flutter_learning_path/features/work_out/countdown_display.dart';
import 'package:flutter_learning_path/features/work_out/timer_notifier.dart';
import 'package:flutter_learning_path/features/work_out/timer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../../config/setup_service_locator.dart';

void main() {
  late ProviderContainer container;

  setUpAll(() => setupServicesLocator());

  setUp(() => container = ProviderContainer());

  testWidgets('Given secondsLeft is zero, countdownDisplay should only have a SizedBox',
      (WidgetTester tester) async {
    container.read($timer.notifier).state = TimerState(countdownDateTime: null, secondsLeft: 0);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(home: CountdownDisplay()),
      ),
    );

    expect(find.byType(Text), findsNothing);
    expect(find.byType(IconButton), findsNothing);
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('Given secondsLeft is 60, countdownDisplay should show 1 min',
      (WidgetTester tester) async {
    container.read($timer.notifier).state = TimerState(countdownDateTime: null, secondsLeft: 60);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Material(
            child: CountdownDisplay(),
          ),
        ),
      ),
    );

    expect(find.text("Wait for 1 : 00"), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
  });

  testWidgets('Given secondsLeft is 90, countdownDisplay should show 1 min 30',
      (WidgetTester tester) async {
    container.read($timer.notifier).state = TimerState(countdownDateTime: null, secondsLeft: 90);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Material(
            child: CountdownDisplay(),
          ),
        ),
      ),
    );

    expect(find.text("Wait for 1 : 30"), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
  });

  testWidgets('Given user presses the IconButton, secondsLeft should change back to zero and hence show only a SizedBox', (WidgetTester tester) async {
    container.read($timer.notifier).state = TimerState(countdownDateTime: null, secondsLeft: 5);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Material(
            child: CountdownDisplay(),
          ),
        ),
      ),
    );

    expect(find.text("Wait for 0 : 05"), findsOneWidget);

    final closeButton = find.byIcon(Icons.close);
    await tester.tap(closeButton);
    await tester.pumpAndSettle();

    expect(find.byType(IconButton), findsNothing);
    expect(find.byType(Text), findsNothing);
    expect(find.byType(SizedBox), findsOneWidget);
  });
}
