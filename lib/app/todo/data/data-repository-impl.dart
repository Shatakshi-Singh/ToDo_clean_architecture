import 'package:clean_architecture_todo/app/todo/domain/repository/todo-repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  @override
  Future<void> addTodo({required String title, required String description}) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> editTodo(
      {required String title,
      required String description,
      required String itemId}) {
    // TODO: implement editTodo
    throw UnimplementedError();
  } 
}
