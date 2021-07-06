import 'package:clean_architecture_todo/app/auth/presentation/splash-screen/splash-screen-controller.dart';
import 'package:clean_architecture_todo/app/auth/presentation/splash-screen/splash-screen-state-machine.dart';
import 'package:clean_architecture_todo/app/auth/presentation/splash-screen/view/widgets/splash-screen-widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashScreenView extends View {
  @override
  State<StatefulWidget> createState() => SplashScreenViewState();
}

class SplashScreenViewState
    extends ResponsiveViewState<SplashScreenView, SplashScreenController> {
  SplashScreenViewState() : super(new SplashScreenController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SplashScreenController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;

      switch (currentStateType) {
        case SplashScreenInitializationState:
          return SplashScreenWidget(
            splashScreenController: controller,
          );
        default:
          throw Exception(
              "invalid state $currentStateType: Splash Screen View");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
