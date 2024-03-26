import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String title;
  final String description;
  final DateTime createdDate;
  final DateTime deadlineDate;

  const Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdDate,
      required this.deadlineDate});

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, createdDate: $createdDate, deadlineDate: $deadlineDate)';
  }

  @override
  List<Object> get props => [
        id,
        title,
      ];
}
