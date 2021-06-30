import 'package:clean_architecture_todo/app/auth/presentation/sign-up/sign-up-controller.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-up/view/widgets/sign-up-content-body.dart';
import 'package:flutter/material.dart';

class SignUpErrorMobileView extends StatefulWidget {
  final SignUpController controller;
  const SignUpErrorMobileView({Key? key, required this.controller})
      : super(key: key);

  @override
  _SignUpErrorMobileViewState createState() => _SignUpErrorMobileViewState();
}

class _SignUpErrorMobileViewState extends State<SignUpErrorMobileView> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  // late SignUpErrorState _errorState;

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
            SignUpContentBody(
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
