import 'package:clean_architecture_todo/app/auth/presentation/sign-in/view/sign-in-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth/presentation/sign-up/view/sign-up-view.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String homePageRoute = '/home-page';
  static const String signInPageRoute = '/sign-in-page';
  static const String signUpPageRoute = '/sign-up-page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(
            builder: (_) => SignInView(), //TODO Change SignIn view
            settings: RouteSettings(name: NavigationService.homePageRoute));
      case signInPageRoute:
        return MaterialPageRoute(
            builder: (_) => SignInView(),
            settings: RouteSettings(name: NavigationService.signInPageRoute));
      case signUpPageRoute:
        return MaterialPageRoute(
            builder: (_) => SignUpView(),
            settings: RouteSettings(name: NavigationService.signUpPageRoute));

      default:
        throw Exception('NavigationService: Invalid Navigation');
    }
  }

  void navigateBack() {
    return navigatorKey.currentState!.pop();
  }

  void navigationPopUntil(String untilRoute) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(untilRoute));
  }

  Future navigateTo(String toRoute,
      {bool shouldReplace = false, Object? arguments}) async {
    //TODO arguments
    if (shouldReplace) {
      return navigatorKey.currentState!
          .pushReplacementNamed(toRoute, arguments: arguments);
    }
    return navigatorKey.currentState!.pushNamed(toRoute, arguments: arguments);
  }
}
