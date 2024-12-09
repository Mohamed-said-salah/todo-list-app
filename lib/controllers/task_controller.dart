import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadTasks();
  }

  // Load tasks from SharedPreferences
  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getString('tasks');
    if (taskList != null) {
      List decodedList = jsonDecode(taskList);
      tasks.value = decodedList.map((task) => Task.fromMap(task)).toList();
    }
  }

  // Save tasks to SharedPreferences
  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedList = jsonEncode(tasks.map((task) => task.toMap()).toList());
    prefs.setString('tasks', encodedList);
  }

  // Add a new task
  void addTask(String title) {
    if (title.isNotEmpty) {
      tasks.add(Task(title: title));
      _saveTasks();
    }
  }

  // Toggle task completion
  void toggleTaskCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    _saveTasks();
  }
}
