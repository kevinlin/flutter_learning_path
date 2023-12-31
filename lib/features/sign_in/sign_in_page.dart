import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learning_path/common/snack_bar.dart';
import 'package:flutter_learning_path/features/sign_in/sign_in_view_model.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:flutter_learning_path/styling/text_field_styling.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends HookWidget {
  SignInPage({super.key});

  final signInViewModel = SignInViewModel();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
          title: Text('Sign in', style: Theme.of(context).textTheme.headlineSmall),
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
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      final isFormValid = formKey.currentState?.validate() ?? false;

                      if (isFormValid) {
                        final isSuccess = await signInViewModel.login(
                            emailTextController.text, passwordTextController.text);

                        if (context.mounted) {
                          if (isSuccess) {
                            return context.go(Routes.upcoming);
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
