import 'dart:async';

import 'package:clean_architecture_todo/app/auth/domain/repository/auth-repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:clean_architecture_todo/app/todo/data/data-repository-impl.dart';

class AddItemUsecase extends CompletableUseCase<AddItemUsecaseParams> {
  final AuthRepository _repository;
  AddItemUsecase(this._repository);
  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();
    // try {
    //   await _repository.addTodo(
    //       title: params!.title, description: params.description);
    // } catch (error) {}
    return streamController.stream;
  }
}

class AddItemUsecaseParams {}
