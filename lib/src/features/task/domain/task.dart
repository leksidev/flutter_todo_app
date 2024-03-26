class Task {
  final int id;
  final String title;
  final String description;
  final DateTime createdDate;
  final DateTime deadlineDate;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdDate,
      required this.deadlineDate});
}
