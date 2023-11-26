import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning_path/common/logger.dart';
import 'package:flutter_learning_path/common/snack_bar.dart';
import 'package:flutter_learning_path/features/sign_up/date_picker.dart';
import 'package:flutter_learning_path/features/sign_up/gender_picker.dart';
import 'package:flutter_learning_path/styling/text_field_styling.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final heightTextController = TextEditingController();
  final weightTextController = TextEditingController();
  final dateOfBirthTextController = TextEditingController();
  GenderType? selectedGender;

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    heightTextController.dispose();
    weightTextController.dispose();
    dateOfBirthTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  selectedGender: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  validator: (_) {
                    if (selectedGender == null) {
                      return 'Gender must be selected';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    final isFormValid =
                        formKey.currentState?.validate() ?? false;

                    if (isFormValid) {
                      logger.i("Saving data...");
                      showSnackBar(context, 'Saving data...');
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
