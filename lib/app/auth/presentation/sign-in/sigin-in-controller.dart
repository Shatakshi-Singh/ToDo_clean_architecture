import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sign-in-presenter.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sign-in-state-machine.dart';
import 'package:clean_architecture_todo/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../../injection-container.dart';
import '../../../navigation-service.dart';

class SignInController extends Controller {
  final SignInPresenter _presenter;
  final SignInStateMachine _stateMachine;
  final NavigationService _navigationService;

  SignInController()
      : _presenter = serviceLocator<SignInPresenter>(),
        _stateMachine = new SignInStateMachine(),
        _navigationService = serviceLocator<NavigationService>(),
        super(); //constructor and super is used to contact clean arc Controller

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

  SignInState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  void userSignIn({required String email, required String password}) {
    _stateMachine.onEvent(new SignInClickEvent());
    refreshUI();
    _presenter.userSignInStatus(
      new UseCaseObserver(
        () {
          _navigationService.navigateTo(NavigationService.homePageRoute,
              shouldReplace: true); //OnComplete
        },
        (error) {
          _stateMachine
              .onEvent(new SignInErrorEvent(email: email, password: password));
          refreshUI(); //onError
        },
      ),
      email: email,
      password: password,
    );
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(NavigationService.signUpPageRoute,
        shouldReplace: false);
  }
}
