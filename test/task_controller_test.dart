import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:todo_list/controllers/task_controller.dart';
import 'package:todo_list/models/task_model.dart';

// Mock class for SharedPreferences
class MockSharedPreferences extends Mock implements SharedPreferences {
  // Mocking the setString method
  @override

  /// Mocks the setString method of SharedPreferences, always returning true
  /// Future.
  ///
  /// The method is overridden to return a Future that completes with true,
  /// since the actual SharedPreferences setString method will always return
  /// true if the key-value pair is successfully stored in the SharedPreferences.
  Future<bool> setString(String? key, String? value) {
    return super.noSuchMethod(
      Invocation.method(#setString, [key, value]),
      returnValue: Future.value(true),
    ) as Future<bool>;
  }
}

/// Unit tests for the TaskController class.
///
/// The TaskController is the class responsible for managing the list of tasks
/// and persisting it to SharedPreferences. This test suite verifies that the
/// TaskController correctly adds new tasks, toggles the completion status of
/// tasks, and does not add empty tasks to the list. It also verifies that the
/// tasks are correctly saved to SharedPreferences after each operation.
void main() {
  group('TaskController', () {
    late TaskController taskController;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() async {
      // Initialize the mock SharedPreferences
      mockSharedPreferences = MockSharedPreferences();

      // Simulate the behavior of SharedPreferences
      when(mockSharedPreferences.getString('tasks'))
          .thenReturn('[]'); // Simulate an empty task list

      // Mock the setString method to return a Future<bool> (true in this case)
      when(mockSharedPreferences.setString(
        argThat(isA<String>()), // Expect the first argument to be a String
        argThat(isA<String>()), // Expect the second argument to be a String
      )).thenAnswer((_) async => true);

      // Instantiate the TaskController with the mocked SharedPreferences (null if needed)
      taskController = TaskController(prefs: mockSharedPreferences);
    });

    test('should add a new task correctly', () async {
      // Arrange
      String newTaskTitle = 'Buy milk';

      // Act
      taskController.addTask(newTaskTitle);

      // Assert
      expect(taskController.tasks.length, 1);
      expect(taskController.tasks[0].title, newTaskTitle);
      expect(taskController.tasks[0].isCompleted, false);

      // Verify that the tasks are saved
      verify(mockSharedPreferences.setString(
          'tasks', jsonEncode([taskController.tasks[0].toMap()])));
    });

    test('should toggle task completion status correctly', () async {
      // Arrange
      Task task = Task(title: 'Buy bread', isCompleted: false);
      taskController.tasks.add(task); // Add task to the list

      // Act
      taskController.toggleTaskCompletion(0); // Toggle the task completion

      // Assert
      expect(taskController.tasks[0].isCompleted, true);

      // Verify that the tasks are saved again after completion toggle
      verify(mockSharedPreferences.setString(
          'tasks', jsonEncode([taskController.tasks[0].toMap()])));
    });

    test('should not add an empty task', () async {
      // Act
      taskController.addTask('');

      // Assert
      expect(taskController.tasks.isEmpty, true);
    });
  });
}
