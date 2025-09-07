class Tasks{
  final int? id;
  final int userId;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;
  final DateTime? createdAt;


  Tasks({
    this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.dueDate,
    this.createdAt,
  });

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      id: map['id'] as int?,
      userId: map['user_id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      isCompleted: (map['is_completed'] as int) == 1,
      dueDate: DateTime.parse(map['due_date'] as String),
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at'] as String) : null,
    );
  }
}