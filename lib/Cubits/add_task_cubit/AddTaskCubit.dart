import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import '../../models/TaskModel.dart';
import 'add_task_state.dart';
class AddTaskCubit extends Cubit<AddTaskState> {

  AddTaskCubit(): super(AddTaskInitial());
  Color color = const Color(0x5F151515);

  AddTask(TaskModel task) async {
    task.color = color.value;
    emit(AddTaskLoading());
    try {
      var TasksBox = Hive.box<TaskModel>("Tasks_Box");
      emit(AddTaskSuccess());
      await TasksBox.add(task);
    } catch (e) {
      emit(AddTaskFailed(e.toString()));
    }

  }
}