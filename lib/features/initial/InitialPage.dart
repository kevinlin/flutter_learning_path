import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key});

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
                  print("Sign in pressed");
                },
                child: Text("Sign In"),
              ),
              OutlinedButton(
                onPressed: () {
                  print("Sign up pressed");
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ));
  }
}
