import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer' as dev;

import '../model/todo_model.dart';

class TodoController extends GetxController {
  final todos = <Todo>[].obs;
  final _key = 'todos';

  @override
  void onInit() {
    final list = GetStorage().read<List>(_key);
    dev.log('Storage list: $list', name: 'Storage');
    if (list != null) {
      todos.value = list.map((e) => Todo.fromMap(e)).toList();
    }

    ever(todos, (callback) {
      GetStorage().write(_key, todos.map((e) => e.toMap()).toList());
    });
    super.onInit();
  }

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void updateTodo(Todo todo) {
    final index = todos.indexOf(todos.where((td) => td.id == todo.id).first);
    todos[index] = todo;
  }

  void markTodoAsDone(Todo todo) {
    final index = todos.indexOf(todo);
    todos[index] = todo.copyWith(isDone: true);
    Get.snackbar(
      'Todo',
      'Marked as Done!',
      duration: const Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void markTodoAsUndone(Todo todo) {
    final index = todos.indexOf(todo);
    todos[index] = todo.copyWith(isDone: false);
    Get.snackbar(
      'Todo',
      'Marked as Not Done!',
      duration: const Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    Get.snackbar(
      'Todo',
      'Todo removed!',
      duration: const Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
