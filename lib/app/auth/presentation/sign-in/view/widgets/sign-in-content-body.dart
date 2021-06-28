import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sigin-in-controller.dart';
import 'package:flutter/material.dart';

class SignInContentBody extends StatefulWidget {
  final SignInController controller;
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  const SignInContentBody(
      {Key? key,
      required this.controller,
      required this.emailTextController,
      required this.passwordTextController})
      : super(key: key);

  @override
  _SignInContentBodyState createState() => _SignInContentBodyState();
}

class _SignInContentBodyState extends State<SignInContentBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100.0),
        Text('Sign In'),
        TextFormField(
          controller: widget.emailTextController,
          decoration:
              InputDecoration(labelText: "Email", hintText: "abc@gmail.com"),
        ),
        TextFormField(
          controller: widget.passwordTextController,
          decoration: InputDecoration(labelText: "Password"),
        ),
        TextButton(
          onPressed: () {
            if (widget.emailTextController.text.isNotEmpty &&
                widget.passwordTextController.text.isNotEmpty) {
              widget.controller.userSignIn(
                  email: widget.emailTextController.text,
                  password: widget.passwordTextController.text);
            }
          },
          child: Text("Sign In"),
        ),
        TextButton(
          onPressed: () {
            widget.controller.navigateToSignUp();
          },
          child: Text("Go to Sign Up"),
        ),
      ],
    );
  }
}
