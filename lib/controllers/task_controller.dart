import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task_model.dart';

class TaskController extends GetxController {
  // Observable list of tasks
  var tasks = <Task>[].obs;

  // Nullable SharedPreferences instance for saving and loading tasks (*optional for testing mockup).
  final SharedPreferences? prefs;

  // Constructor with optional SharedPreferences
  TaskController({this.prefs});

  @override

  /// Initialize the controller by calling the superclass's onInit and
  /// loading tasks from SharedPreferences.
  void onInit() {
    super.onInit();
    _loadTasks();
  }

  // Load tasks from SharedPreferences
  /// Loads tasks from SharedPreferences. If the SharedPreferences instance is null, it
  /// initializes one. If the 'tasks' key is present in SharedPreferences, it decodes the
  /// JSON string associated with the key and assigns it to the 'tasks' observable list.
  ///
  void _loadTasks() async {
    final SharedPreferences effectivePrefs =
        prefs ?? await SharedPreferences.getInstance();
    final taskList = effectivePrefs.getString('tasks');
    if (taskList != null) {
      List decodedList = jsonDecode(taskList);
      tasks.value = decodedList.map((task) => Task.fromMap(task)).toList();
    }
  }

  // Save tasks to SharedPreferences
  /// Saves the tasks list to SharedPreferences. If the SharedPreferences instance
  /// is null, it initializes one. It encodes the tasks list as a JSON string and
  /// saves it to SharedPreferences under the key 'tasks'.
  void _saveTasks() async {
    final SharedPreferences effectivePrefs =
        prefs ?? await SharedPreferences.getInstance();
    final encodedList = jsonEncode(tasks.map((task) => task.toMap()).toList());
    effectivePrefs.setString('tasks', encodedList);
  }

  // Add a new task
  /// Adds a new task to the tasks list and persists the updated list to SharedPreferences.
  ///
  /// If the [title] is not empty, a new [Task] is created with the given title and added to
  /// the tasks list. The [_saveTasks] method is then called to persist the updated list to
  /// SharedPreferences.
  void addTask(String title) {
    if (title.isNotEmpty) {
      tasks.add(Task(title: title)); // Add task to the list
      _saveTasks();
    }
  }

  // Toggle task completion
  /// Toggles the completion status of a task at the specified index in the tasks list.
  ///
  /// This method inverts the `isCompleted` property of the [Task] at the given [index],
  /// refreshes the list to update the UI, and saves the updated tasks list to
  /// SharedPreferences.
  ///
  /// [index] is the position of the task in the tasks list whose completion status is to be toggled.
  void toggleTaskCompletion(int index) {
    tasks[index].isCompleted =
        !tasks[index].isCompleted; // Toggle completion status
    tasks.refresh(); // Notify GetX to refresh the list
    _saveTasks(); // Persist updated tasks
  }
}
