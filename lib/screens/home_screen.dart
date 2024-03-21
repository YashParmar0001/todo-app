import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/screens/add_todo_screen.dart';
import 'package:todo_app/screens/edit_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddTodoScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Obx(
          () {
            return (todoController.todos.isEmpty)
                ? const Center(child: Text('Nothing to Show!'))
                : ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (context, index) {
                      final todo = todoController.todos[index];
                      return ListTile(
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (value) {
                            if (value != null) {
                              if (value) {
                                todoController.markTodoAsDone(todo);
                              } else {
                                todoController.markTodoAsUndone(todo);
                              }
                            }
                          },
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(todo.text),
                            IconButton(
                              onPressed: () {
                                Get.to(EditTodoScreen(todo: todo));
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            todoController.removeTodo(todo);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
