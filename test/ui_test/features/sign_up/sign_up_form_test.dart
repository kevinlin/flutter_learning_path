import 'package:flutter/material.dart';
import 'package:flutter_learning_path/features/sign_up/sign_up_form.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../config/setup_service_locator.dart';
import '../../../extensions/widget_tester_ext.dart';

void main() {
  setUpAll(() {
    setupServicesLocator();
  });

  testWidgets(
    'Given SignUpForm, when user enters values and presses submit then values are passed to SignUpViewModel',
    (WidgetTester tester) async {
      await tester.pumpCustomWidget(
        Material(child: SignUpForm()),
      );

      final emailFinder = find.byType(TextField).at(0);
      final TextField button = tester.widget(emailFinder);
      expect(button.decoration?.labelText, "Email");
      await tester.enterText(emailFinder, "tester@example.com");

      final passwordFinder = find.byType(TextField).at(1);
      final TextField passwordTextField = tester.widget(passwordFinder);
      expect(passwordTextField.decoration?.labelText, "Password");
      await tester.enterText(passwordFinder, "Zuhlke123");

      final dateOfBirthFinder = find.byType(TextField).at(2);
      final TextField dateOfBirthTextField = tester.widget(dateOfBirthFinder);
      expect(dateOfBirthTextField.decoration?.labelText, "Date of Birth");
      await tester.tap(dateOfBirthFinder);
      await tester.pumpAndSettle();
      final firstDateFinder = find.text("1");
      await tester.tap(firstDateFinder);
      await tester.pumpAndSettle();
      final doneFinder = find.text("Done");
      await tester.tap(doneFinder);
      await tester.pumpAndSettle();
      await tester.screenshot();

      final heightFinder = find.byType(TextField).at(3);
      final TextField heightTextField = tester.widget(heightFinder);
      expect(heightTextField.decoration?.labelText, "Height (cm)");
      await tester.enterText(heightFinder, "175");

      final weightFinder = find.byType(TextField).at(4);
      final TextField weightTextField = tester.widget(weightFinder);
      expect(weightTextField.decoration?.labelText, "Weight (kg)");
      await tester.enterText(weightFinder, "80");

      await tester.pumpAndSettle();
      await tester.screenshot();
    },
  );
}
