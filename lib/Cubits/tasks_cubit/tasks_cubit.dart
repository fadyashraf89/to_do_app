import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/TaskModel.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  fetchAllTasks() async {
    try {
      var TasksBox = Hive.box<TaskModel>("Tasks_Box");
      List<TaskModel> tasks = TasksBox.values.toList();
      emit(TasksSuccess(tasks));
    } catch (e) {
      emit(TasksFailed(e.toString()));
    }
  }
}
