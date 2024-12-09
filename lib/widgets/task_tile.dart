import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;

  const TaskTile({super.key, required this.task, required this.index});

  @override

  /// Builds a widget representing a task item with a title and a completion checkbox.
  ///
  /// The widget is a [ListTile] containing the task's [title] and a [Checkbox]
  /// indicating whether the task is completed. When the checkbox state changes,
  /// it toggles the task's completion status in the [TaskController].
  ///
  /// [context] is the build context in which the widget is built.
  Widget build(BuildContext context) {
    // Get the TaskController instance
    final TaskController taskController = Get.find();

    return ListTile(
      title: Text(task.title),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (bool? value) {
          // Update task completion status in the controller
          taskController.toggleTaskCompletion(index);
        },
      ),
    );
  }
}
