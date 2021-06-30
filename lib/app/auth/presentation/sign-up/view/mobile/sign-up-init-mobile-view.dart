import 'package:clean_architecture_todo/app/auth/presentation/sign-up/view/widgets/sign-up-content-body.dart';
import 'package:flutter/material.dart';

import '../../sign-up-controller.dart';

class SignUpInitMobileView extends StatefulWidget {
  final SignUpController controller;
  const SignUpInitMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _SignUpInitMobileViewState createState() => _SignUpInitMobileViewState();
}

class _SignUpInitMobileViewState extends State<SignUpInitMobileView> {
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
            child: SignUpContentBody(
                controller: widget.controller,
                emailTextController: _emailTextController,
                passwordTextController: _passwordTextController)));
  }
}
