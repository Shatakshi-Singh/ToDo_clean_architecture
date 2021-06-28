import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sigin-in-controller.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/view/widgets/sign-in-content-body.dart';
import 'package:flutter/material.dart';

class SignInInitMobileView extends StatefulWidget {
  final SignInController controller;
  const SignInInitMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _SignInInitMobileViewState createState() => _SignInInitMobileViewState();
}

class _SignInInitMobileViewState extends State<SignInInitMobileView> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

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
            child: SignInContentBody(
                controller: widget.controller,
                emailTextController: _emailTextController,
                passwordTextController: _passwordTextController)));
  }
}
