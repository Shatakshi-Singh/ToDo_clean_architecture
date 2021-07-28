import 'package:clean_architecture_todo/app/todo/domain/entity/todo-entity.dart';

abstract class ToDoRepository {
  Future<void> addTodo({
    required String title,
    required String description,
  });
  // Future<List<TodoEntity>> getTodo;
  Future<void> editTodo(
      {required String title,
      required String description,
      required String itemId});
}
