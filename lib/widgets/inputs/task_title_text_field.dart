import 'package:flutter/material.dart';

class TaskTitleTextField extends StatelessWidget {
  const TaskTitleTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return // Add Task Text field
        Expanded(
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: "Enter a new task"),
      ),
    );
  }
}
