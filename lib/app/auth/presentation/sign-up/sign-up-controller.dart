import 'package:clean_architecture_todo/app/auth/presentation/sign-up/sign-up-presenter.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-up/sign-up-state-machine.dart';
import 'package:clean_architecture_todo/core/presentation/observer.dart';
import 'package:clean_architecture_todo/injection-container.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../navigation-service.dart';

class SignUpController extends Controller {
  final SignUpPresenter _presenter;
  final SignUpStateMachine _stateMachine;
  final NavigationService _navigationService;

  SignUpController()
      : _presenter = serviceLocator<SignUpPresenter>(),
        _stateMachine = new SignUpStateMachine(),
        _navigationService = serviceLocator<NavigationService>(),
        super();

  @override
  void initListeners() {
    // TODO: implement initListeners
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

  SignUpState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  void userSignUp({required String email, required String password}) {
    _stateMachine.onEvent(new SignUpClickEvent());
    refreshUI();
    _presenter.userSignUpStatus(
      new UseCaseObserver(
        () {
          _navigationService.navigateTo(NavigationService.homePageRoute,
              shouldReplace: true); //OnComplete
        },
        (error) {
          _stateMachine.onEvent(new SignUpErrorEvent());
          refreshUI(); //onError
        },
      ),
      email: email,
      password: password,
    );
  }

  void navigateToSignIn() {
    //TODO navigate to sign in
    _navigationService.navigateTo(NavigationService.signInPageRoute,
        shouldReplace: false);
  }
}
