import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/src/features/task/domain/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    List<Task> tasks = [];
    on<CreateNewTask>(
      (CreateNewTask event, Emitter<TaskState> emit) {
        try {
          Task task = Task(
            id: event.task.id,
            title: event.task.title,
            description: event.task.description,
            deadlineDate: event.task.deadlineDate,
          );
          tasks.add(task);
          if (task.title.isNotEmpty) {
            return emit(
              TaskSuccess(task: task),
            );
          }
          if (task.title.isEmpty) {
            return emit(
              TaskError(message: 'Заполните заголовок задачи'),
            );
          }
        } catch (e) {
          emit(TaskError(message: 'Error: $e'));
        }
      },
    );

    on<DeleteTask>(
      (DeleteTask event, Emitter<TaskState> emit) {
        try {
          tasks.removeWhere((element) => element.id == event.task.id);
          emit(
            TaskDeleted(
              task: event.task,
            ),
          );
        } catch (e) {
          emit(
            TaskError(message: 'Error: $e'),
          );
        }
      },
    );
  }
}
