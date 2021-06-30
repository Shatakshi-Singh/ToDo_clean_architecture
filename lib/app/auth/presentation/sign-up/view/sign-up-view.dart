import 'package:clean_architecture_todo/app/auth/presentation/sign-up/sign-up-controller.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-up/sign-up-state-machine.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-up/view/mobile/sign-up-error-mobile-view.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-up/view/mobile/sign-up-init-mobile-view.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-up/view/mobile/sign-up-loading-mobile-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignUpView extends View {
  @override
  State<StatefulWidget> createState() => SignUpViewState();
}

class SignUpViewState
    extends ResponsiveViewState<SignUpView, SignUpController> {
  SignUpViewState() : super(new SignUpController());

  @override
  // implement desktopView
  Widget get desktopView => throw UnimplementedError();

  @override
  // implement mobileView
  Widget get mobileView {
    return ControlledWidgetBuilder<SignUpController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      print('Mobile view called with state $currentStateType');

      switch (currentStateType) {
        case SignUpInitState:
          return SignUpInitMobileView(controller: controller);
        case SignUpLoadingState:
          return SignUpLoadingMobileView();
        case SignUpErrorState:
          return SignUpErrorMobileView(controller: controller);
        default:
          throw Exception('Unknown state : $currentStateType: SignUpView');
      }
    }); //state ke accoring view manipulate
  }

  @override
  //implement tabletView
  Widget get tabletView => throw UnimplementedError();

  @override
  //implement watchView
  Widget get watchView => throw UnimplementedError();
}
