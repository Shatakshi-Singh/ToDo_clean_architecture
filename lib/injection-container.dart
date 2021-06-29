import 'package:clean_architecture_todo/app/auth/data/auth-repository-impl.dart';
import 'package:clean_architecture_todo/app/auth/domain/repository/auth-repository.dart';
import 'package:clean_architecture_todo/app/auth/domain/usecase/user-sign-in-usecase.dart';
import 'package:clean_architecture_todo/app/navigation-service.dart';
import 'package:get_it/get_it.dart';

import 'app/auth/domain/usecase/check-user-sign-in-usecase.dart';
import 'app/auth/domain/usecase/user-sign-out-usecase.dart';
import 'app/auth/domain/usecase/user-sign-up-usecase.dart';
import 'app/auth/presentation/sign-in/sign-in-presenter.dart';
import 'app/auth/presentation/sign-up/sign-up-presenter.dart';
import 'app/auth/presentation/splash-screen/splash-screen-presenter.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  serviceLocator.registerLazySingleton(() => NavigationService());

  //auth
  //usecase
  serviceLocator.registerFactory(() => UserSignInUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignUpUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignOutUseCase(serviceLocator()));
  serviceLocator
      .registerFactory(() => CheckUserSignInUseCase(serviceLocator()));

  //presenter
  serviceLocator.registerFactory(() => SignInPresenter(serviceLocator()));
  serviceLocator.registerFactory(() => SignUpPresenter(serviceLocator()));
  serviceLocator.registerFactory(() => SplashScreenPresenter(serviceLocator()));

  //repository
  serviceLocator
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}

Future<void> reset() async {
  serviceLocator.resetLazySingleton<AuthRepository>();
}
