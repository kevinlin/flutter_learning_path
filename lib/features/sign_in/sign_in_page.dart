import 'package:flutter/material.dart';
import 'package:flutter_learning_path/common/snack_bar.dart';
import 'package:flutter_learning_path/features/sign_in/sign_in_view_model.dart';
import 'package:flutter_learning_path/styling/text_field_styling.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final signInViewModel = SignInViewModel();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              }),
          title: Text(
            'Sign in',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: buildInputDecoration(context, "Email"),
                    controller: emailTextController,
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
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration: buildInputDecoration(context, "Password"),
                    controller: passwordTextController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      final isFormValid = formKey.currentState?.validate() ?? false;

                      if (isFormValid) {
                        final isSuccess = await signInViewModel.login(
                            emailTextController.text, passwordTextController.text);

                        if (mounted) {
                          if (isSuccess) {
                            // TODO update when we have created upcoming page
                          } else {
                            showSnackBar(context, 'Check your email or password', Colors.red);
                          }
                        }
                      }
                    },
                    child: Text("Sign In"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
