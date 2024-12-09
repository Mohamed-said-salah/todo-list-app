import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_tile.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TaskController taskController = Get.put(TaskController());
  final TextEditingController textController = TextEditingController();

  @override

  /// Build the To-Do List screen.
  //
  /// The screen has an app bar with the title "To-Do List". The body is a
  /// column with three children:
  //
  /// 1. A row with a text field for entering a new task and an add button.
  //
  /// 2. A list view of the tasks, with each item being a task tile.
  //
  /// When a new task is entered, it is added to the list when the add button is
  /// pressed. The list is displayed in reverse order of when the tasks were
  /// added (newest first). Each task tile is an Observable Widget that
  /// automatically updates when the task is completed.
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
