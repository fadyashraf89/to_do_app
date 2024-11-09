import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/TaskModel.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  List<TaskModel>? tasks;

  fetchAllTasks() async {
    var TasksBox = Hive.box<TaskModel>("Tasks_Box");
    tasks = TasksBox.values.toList();
    if (tasks!.isEmpty) {
      emit(TasksEmpty());
    } else {
      emit(TasksSuccess());
    }

  }
}
