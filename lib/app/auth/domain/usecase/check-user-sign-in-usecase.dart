import 'dart:async';

import 'package:clean_architecture_todo/app/auth/domain/repository/auth-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CheckUserSignInUseCase extends CompletableUseCase<void> {
  final AuthRepository _repository;

  CheckUserSignInUseCase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      bool loginStatus = _repository.checkUserSignInStatus();
      streamController.add(loginStatus);
      streamController.close();
    } catch (error) {
      print('error in getting sign in status: $error : CheckUserSignInUseCase');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}
