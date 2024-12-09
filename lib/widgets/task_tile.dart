import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;

  const TaskTile({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
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
