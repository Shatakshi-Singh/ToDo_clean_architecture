import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sigin-in-controller.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sign-in-state-machine.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/view/widgets/sign-in-content-body.dart';
import 'package:flutter/material.dart';

class SignInErrorMobileView extends StatefulWidget {
  final SignInController controller;
  const SignInErrorMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _SignInErrorMobileViewState createState() => _SignInErrorMobileViewState();
}

class _SignInErrorMobileViewState extends State<SignInErrorMobileView> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  // late SignInErrorState _errorState;

  @override
  void initState() {
    _emailTextController = new TextEditingController();
    _passwordTextController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            SignInContentBody(
                controller: widget.controller,
                emailTextController: _emailTextController,
                passwordTextController: _passwordTextController),
            Text('Error'),
          ],
        ),
      ),
    );
  }
}
