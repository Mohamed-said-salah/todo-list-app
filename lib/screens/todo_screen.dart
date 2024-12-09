import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_tile.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TaskController taskController = Get.put(TaskController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Add Task Text field
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration:
                        const InputDecoration(hintText: "Enter a new task"),
                  ),
                ),

                // Add Task button
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    taskController.addTask(textController.text);
                    textController.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskController.tasks.reversed
                      .toList()[index]; // Reverse the list for display only

                  // Map the reversed index to the correct task in the original list
                  int originalIndex = taskController.tasks.length - 1 - index;

                  return TaskTile(
                    task: task,
                    index: originalIndex,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
