import 'package:flutter/material.dart';
import 'package:flutter_learning_path/router/routes.dart';
import 'package:go_router/go_router.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", height: 85),
              Text(
                "Keep track of your lifting goals",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  context.push(Routes.signIn);
                },
                child: Text("Sign In"),
              ),
              OutlinedButton(
                onPressed: () {
                  context.push(Routes.signUp);
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ));
  }
}
