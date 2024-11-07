abstract class AddTaskState{}

class AddTaskInitial extends AddTaskState {}
class AddTaskLoading extends AddTaskState {}
class AddTaskSuccess extends AddTaskState {}
class AddTaskFailed extends AddTaskState {
  final String errorMessage;

  AddTaskFailed(this.errorMessage);
}
