import 'dart:async';
import 'package:clean_architecture_todo/app/auth/domain/repository/auth-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserSignInUseCase extends CompletableUseCase<UserSignInUseCaseParams> {
  final AuthRepository _repository;
  UserSignInUseCase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      await _repository.userSignIn(
          email: params!.email, password: params.password);
      streamController.close();
    } catch (error) {
      print('error in user sign in $error : UserSignInUseCase');
      streamController.addError(error);
    }

    return streamController.stream;
  }
}

class UserSignInUseCaseParams {
  final String email;
  final String password;
  UserSignInUseCaseParams({required this.email, required this.password});
}
