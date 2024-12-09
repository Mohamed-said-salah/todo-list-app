class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  // Convert Task to a map
  /// Converts this [Task] to a map for JSON encoding.
  ///
  /// The returned map contains the title and isCompleted properties of the task.
  ///
  Map<String, dynamic> toMap() {
    return {'title': title, 'isCompleted': isCompleted};
  }

  // Convert map to Task
  /// Creates a [Task] from a map.
  ///
  /// The required map keys are 'title' and 'isCompleted'. The values are used to
  /// initialize the corresponding properties of the returned [Task].
  ///
  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      isCompleted: map['isCompleted'],
    );
  }
}
