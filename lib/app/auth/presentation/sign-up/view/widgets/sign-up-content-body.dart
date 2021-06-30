import 'package:clean_architecture_todo/app/auth/presentation/sign-up/sign-up-controller.dart';
import 'package:flutter/material.dart';

class SignUpContentBody extends StatefulWidget {
  final SignUpController controller;
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  const SignUpContentBody(
      {Key? key,
      required this.controller,
      required this.emailTextController,
      required this.passwordTextController})
      : super(key: key);

  @override
  _SignUpContentBodyState createState() => _SignUpContentBodyState();
}

class _SignUpContentBodyState extends State<SignUpContentBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100.0),
        Text('Sign Up'),
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
              widget.controller.userSignUp(
                  email: widget.emailTextController.text,
                  password: widget.passwordTextController.text);
            }
          },
          child: Text("Sign Up"),
        ),
        TextButton(
          onPressed: () {
            widget.controller.navigateToSignIn();
          },
          child: Text("Go to Sign In"),
        ),
      ],
    );
  }
}
