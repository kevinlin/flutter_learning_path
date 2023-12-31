import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learning_path/common/snack_bar.dart';
import 'package:flutter_learning_path/common/string_extension.dart';
import 'package:flutter_learning_path/features/sign_up/date_picker.dart';
import 'package:flutter_learning_path/features/sign_up/gender_picker.dart';
import 'package:flutter_learning_path/features/sign_up/sign_up_view_model.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:flutter_learning_path/styling/text_field_styling.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends HookWidget {
  SignUpForm({super.key});

  final SignUpViewModel signUpViewModel = SignUpViewModel();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final dateOfBirthTextController = useTextEditingController();
    final heightTextController = useTextEditingController();
    final weightTextController = useTextEditingController();
    final selectedGender = useState<GenderType?>(null);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: emailTextController,
                  decoration: buildInputDecoration(context, "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    if (!value.contains("@")) {
                      return "Email need to contain @";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  controller: passwordTextController,
                  decoration: buildInputDecoration(context, "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    if (value.length < 8) {
                      return 'Length of password must be more than 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                DatePicker(
                  title: "Date of Birth",
                  controller: dateOfBirthTextController,
                ),
                SizedBox(height: 15),
                TextFormField(
                  textAlign: TextAlign.left,
                  controller: heightTextController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                  ],
                  decoration: buildInputDecoration(context, "Height (cm)"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Height cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: weightTextController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                  ],
                  decoration: buildInputDecoration(context, "Weight (kg)"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Weight cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                GenderPicker(
                  selectedGender: selectedGender.value,
                  onChanged: (value) {
                    selectedGender.value = value;
                  },
                  validator: (_) {
                    if (selectedGender.value == null) {
                      return 'Gender must be selected';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    final isFormValid = formKey.currentState?.validate() ?? false;

                    if (isFormValid) {
                      showSnackBar(context, 'Saving data...');

                      final (isSuccess, errorText) = await signUpViewModel.signUp(
                        email: emailTextController.text,
                        password: passwordTextController.text,
                        gender: selectedGender.value,
                        dateOfBirth: dateOfBirthTextController.text.fromDateTextToDateTime(),
                        height: int.parse(heightTextController.text),
                        weight: int.parse(weightTextController.text),
                      );

                      if (context.mounted) {
                        if (isSuccess) {
                          showSnackBar(context, 'User created successfully', Colors.green);
                          return context.go(Routes.initial);
                        } else if (errorText != null) {
                          showSnackBar(context, errorText, Colors.red);
                        } else {
                          showSnackBar(context, 'Error creating user', Colors.red);
                        }
                      }
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
