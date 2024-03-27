import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final List<String> tags;
  final String title;
  final String description;
  final DateTime createdDate = DateTime.now();
  final DateTime? deadlineDate;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.deadlineDate,
    this.tags = const [],
  });

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, createdDate: $createdDate)';
  }

  @override
  List<Object> get props => [
        id,
        title,
      ];
}
