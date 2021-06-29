import 'package:clean_architecture_todo/app/auth/presentation/splash-screen/splash-screen-controller.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatelessWidget {
  final SplashScreenController splashScreenController;
  const SplashScreenWidget({Key? key, required this.splashScreenController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    splashScreenController.userSignInCheckStatus();
    return Scaffold(
      body: Center(
        child: Icon(Icons.star),
      ),
    );
  }
}
