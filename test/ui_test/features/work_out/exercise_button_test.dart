import 'package:flutter/material.dart';
import 'package:flutter_learning_path/features/work_out/exercise_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Given target reps is 5 and current reps null, ExerciseButton should show 5 inside the circle, and have grey background',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ExerciseButton(
            targetReps: 5,
            currentReps: null,
            handlePress: () {},
          ),
        ),
      );

      expect(find.text("5"), findsOneWidget);

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final bgColor = button.style?.backgroundColor?.resolve({})?.value;
      expect(bgColor, Color(0xFF262626).value);
    },
  );

  testWidgets(
    'Given target reps is 5 and current reps 1, ExerciseButton should show 1 inside the circle, and have redAccent bg',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ExerciseButton(
            targetReps: 5,
            currentReps: 1,
            handlePress: () {},
          ),
        ),
      );

      expect(find.text("1"), findsOneWidget);

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final bgColor = button.style?.backgroundColor?.resolve({})?.value;
      expect(bgColor, Colors.redAccent.value);
    },
  );

  testWidgets(
    'Given target reps is 5 and current reps 5, ExerciseButton should show 5 inside the circle, and have redAccent bg',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ExerciseButton(
            targetReps: 5,
            currentReps: 5,
            handlePress: () {},
          ),
        ),
      );

      expect(find.text("5"), findsOneWidget);

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final bgColor = button.style?.backgroundColor?.resolve({})?.value;
      expect(bgColor, Colors.redAccent.value);
    },
  );

  testWidgets(
    'Given user taps exercise button, then handlePress callback should fire',
    (WidgetTester tester) async {
      bool wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: ExerciseButton(
            targetReps: 5,
            currentReps: 5,
            handlePress: () {
              wasPressed = true;
            },
          ),
        ),
      );

      expect(wasPressed, false);
      final exerciseButtonFinder = find.byType(ExerciseButton);
      await tester.tap(exerciseButtonFinder);
      expect(wasPressed, true);
    },
  );
}
