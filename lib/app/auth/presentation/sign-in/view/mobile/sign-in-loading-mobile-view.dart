import 'package:flutter/material.dart';

class SignInLoadingMobileView extends StatelessWidget {
  const SignInLoadingMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
