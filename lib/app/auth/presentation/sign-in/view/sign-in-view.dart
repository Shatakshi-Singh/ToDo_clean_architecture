import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sigin-in-controller.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sign-in-state-machine.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/view/mobile/sign-in-error-mobile-view.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/view/mobile/sign-in-init-mobile-view.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/view/mobile/sign-in-loading-mobile-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInView extends View {
  @override
  State<StatefulWidget> createState() => SignInViewState();
}

class SignInViewState
    extends ResponsiveViewState<SignInView, SignInController> {
  SignInViewState()
      : super(
            new SignInController()); //SignInviewState constructor passing base class SignInController

  @override
  // TODO: implement desktopView
  Widget get desktopView => throw UnimplementedError();

  @override
  // implement mobileView
  Widget get mobileView {
    return ControlledWidgetBuilder<SignInController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      print('Mobile view called with state $currentStateType');

      switch (currentStateType) {
        case SignInInitState:
          return SignInInitMobileView(controller: controller);
        case SignInLoadingState:
          return SignInLoadingMobileView();
        case SignInErrorState:
          return SignInErrorMobileView(controller: controller);
        default:
          throw Exception('Unknown state : $currentStateType: SignInView');
      }
    }); //state ke accoring view manipulate
  }

  @override
  // TODO: implement tabletView
  Widget get tabletView => throw UnimplementedError();

  @override
  // TODO: implement watchView
  Widget get watchView => throw UnimplementedError();
}
