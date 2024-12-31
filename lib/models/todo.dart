class Todo {
  final String title;
  bool isCompleted;

  Todo({
    required this.title,
    this.isCompleted = false,
  });

  // Convert a Todo to a Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  // Create a Todo from a Map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}
