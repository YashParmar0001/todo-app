import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/model/todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoController = Get.find<TodoController>();
  late final TextEditingController todoEditingController;

  @override
  void initState() {
    todoEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    todoEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What do you want to do?',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: todoEditingController,
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              minLines: 3,
              maxLines: 50,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final todo = Todo(
                  id: DateTime.now().millisecondsSinceEpoch,
                  text: todoEditingController.text,
                  isDone: false,
                );
                todoController.addTodo(todo);
                Get.back();
                Get.snackbar(
                  'Todo',
                  'Todo added successfully!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
