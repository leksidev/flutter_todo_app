part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {
  final Task task;

  TaskSuccess({required this.task});
}

class TaskDeleted extends TaskState {
  final Task task;
  TaskDeleted({required this.task});
}

class TaskError extends TaskState {
  final String message;
  TaskError({required this.message});
}
