class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  // Convert Task to a map
  Map<String, dynamic> toMap() {
    return {'title': title, 'isCompleted': isCompleted};
  }

  // Convert map to Task
  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      isCompleted: map['isCompleted'],
    );
  }
}
