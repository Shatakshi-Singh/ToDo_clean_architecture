import 'dart:async';

import 'package:clean_architecture_todo/app/auth/domain/repository/auth-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserSignOutUsecase extends CompletableUseCase<void> {
  final AuthRepository _repository;
  UserSignOutUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(void params) async {
    final StreamController<void> streamController = StreamController();
    try {
      await _repository.signOut();
      streamController.close();
    } catch (error) {
      print('error in user sign out $error : UserSignOutUseCase');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}
