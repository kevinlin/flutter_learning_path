import 'package:flutter/material.dart';
import 'package:flutter_learning_path/styling/text_styling_extension.dart';

enum GenderType { MALE, FEMALE }

class GenderPicker extends StatelessWidget {
  const GenderPicker({
    Key? key,
    required this.selectedGender,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  final GenderType? selectedGender;
  final void Function(GenderType?)? onChanged;
  final String? Function(GenderType?) validator;

  @override
  Widget build(BuildContext context) {
    return FormField(
        validator: validator,
        builder: (formFieldState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      title: Text(
                        "Male",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      leading: Radio(
                        value: GenderType.MALE,
                        groupValue: selectedGender,
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      title: Text(
                        "Female",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      leading: Radio(
                        value: GenderType.FEMALE,
                        groupValue: selectedGender,
                        onChanged: onChanged,
                      ),
                    ),
                  )
                ],
              ),
              if (formFieldState.hasError)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    formFieldState.errorText!,
                    textAlign: TextAlign.start,
                    style:
                        Theme.of(context).textTheme.labelMedium?.withColorError,
                  ),
                ),
            ],
          );
        });
  }
}
