import 'package:clean_architecture_todo/app/auth/domain/usecase/user-sign-in-usecase.dart';
import 'package:clean_architecture_todo/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInPresenter extends Presenter {
  final UserSignInUseCase _userSignInUseCase;
  SignInPresenter(this._userSignInUseCase);

  @override
  void dispose() {
    _userSignInUseCase.dispose(); //to reinitialize usecase
  }

  void userSignInStatus(UseCaseObserver observer,
      {required String email, required String password}) {
    _userSignInUseCase.execute(observer,
        new UserSignInUseCaseParams(email: email, password: password));
  }
}
