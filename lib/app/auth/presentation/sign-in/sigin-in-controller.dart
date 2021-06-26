import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sign-in-presenter.dart';
import 'package:clean_architecture_todo/app/auth/presentation/sign-in/sign-in-state-machine.dart';
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
        _navigationService = serviceLocator<NavigationService>();

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
}
