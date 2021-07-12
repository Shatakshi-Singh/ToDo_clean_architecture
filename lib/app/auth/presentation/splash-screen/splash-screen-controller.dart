import 'package:clean_architecture_todo/app/auth/presentation/splash-screen/splash-screen-presenter.dart';
import 'package:clean_architecture_todo/app/auth/presentation/splash-screen/splash-screen-state-machine.dart';
import 'package:clean_architecture_todo/app/navigation-service.dart';
import 'package:clean_architecture_todo/core/presentation/observer.dart';
import 'package:clean_architecture_todo/injection-container.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashScreenController extends Controller {
  final SplashScreenPresenter _presenter;
  final SplashScreenStateMachine _stateMachine;
  final NavigationService _navigationService;

  SplashScreenController()
      : _presenter = serviceLocator<SplashScreenPresenter>(),
        _stateMachine = new SplashScreenStateMachine(),
        _navigationService = serviceLocator<NavigationService>(),
        super();

  @override
  void initListeners() {
    //implement initListeners
  }

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed(); //cleaning
  }

  SplashScreenState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  void userSignInCheckStatus() {
    _presenter.checkUserSignIn(new UseCaseObserver(() {}, (error) {
      _navigationService.navigateTo(NavigationService.signInPageRoute,
          shouldReplace: true);
    }, onNextFunc: (bool signInStatus) {
      if (signInStatus) {
        _navigationService.navigateTo(NavigationService.homePageRoute,
            shouldReplace: true);
      } else {
        _navigationService.navigateTo(NavigationService.signInPageRoute,
            shouldReplace: true);
      }
    }));
  }
}
