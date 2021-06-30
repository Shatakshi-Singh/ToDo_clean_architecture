import 'package:flutter/material.dart';

class SignUpLoadingMobileView extends StatelessWidget {
  const SignUpLoadingMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
