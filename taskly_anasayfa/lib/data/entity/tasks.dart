class Tasks{
  final int id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;

  Tasks({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.isCompleted,
  });
}