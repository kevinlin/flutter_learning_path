import 'package:flutter/material.dart';
import 'package:flutter_learning_path/common/date_time_extension.dart';
import 'package:flutter_learning_path/styling/text_field_styling.dart';
import 'package:go_router/go_router.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.none,
      onTap: () {
        showDatePicker(context);
      },
      decoration: buildInputDecoration(context, title),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Date of birth cannot be empty';
        }
        return null;
      },
    );
  }

  void showDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Choose Your Date",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          content: SizedBox(
            width: 300,
            child: CalendarDatePicker(
              initialCalendarMode: DatePickerMode.day,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(DateTime.now().year + 1),
              onDateChanged: (value) {
                controller.text = value.toDateOnlyText();
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Done"),
            ),
          ],
        );
      },
    );
  }
}
