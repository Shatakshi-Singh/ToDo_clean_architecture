import 'package:clean_architecture_todo/app/auth/domain/usecase/check-user-sign-in-usecase.dart';
import 'package:clean_architecture_todo/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashScreenPresenter extends Presenter {
  final CheckUserSignInUseCase _checkUserSignInUseCase;

  SplashScreenPresenter(this._checkUserSignInUseCase);
  @override
  void dispose() {
    _checkUserSignInUseCase.dispose();
  }

  void checkUserSignIn(UseCaseObserver observer) {
    _checkUserSignInUseCase.execute(observer);
  }
}
