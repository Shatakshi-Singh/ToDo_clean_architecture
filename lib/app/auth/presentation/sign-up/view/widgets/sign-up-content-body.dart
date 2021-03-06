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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100.0),
          Icon(
            Icons.app_registration_rounded,
            color: Colors.cyan,
            size: 40.0,
          ),
          SizedBox(height: 17.0),
          Text(
            'Sign Up',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 17.0),
          TextFormField(
            controller: widget.emailTextController,
            decoration: InputDecoration(
              labelText: "Email",
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.grey,
              ),
              hintText: "abc@gmail.com",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          SizedBox(height: 17.0),
          TextFormField(
            controller: widget.passwordTextController,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.emailTextController.text.isNotEmpty &&
                  widget.passwordTextController.text.isNotEmpty) {
                widget.controller.userSignUp(
                    email: widget.emailTextController.text,
                    password: widget.passwordTextController.text);
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: 300.0,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              widget.controller.navigateToSignIn();
            },
            child: Container(
              alignment: Alignment.center,
              width: 300.0,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Go to Sign In',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
