part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}
class TasksEmpty extends TasksState{}
class TasksSuccess extends TasksState {}
