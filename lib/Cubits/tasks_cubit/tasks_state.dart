part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksSuccess extends TasksState {
  final List<TaskModel> tasks;
  TasksSuccess(this.tasks);
}

class TasksFailed extends TasksState {
  final String errMessage;
  TasksFailed(this.errMessage);
}

