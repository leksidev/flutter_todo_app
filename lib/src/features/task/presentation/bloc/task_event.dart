part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class CreateNewTask extends TaskEvent {
  final Task task;
  CreateNewTask({required this.task});
}

class DeleteTask extends TaskEvent {
  final Task task;
  DeleteTask({required this.task});
}
