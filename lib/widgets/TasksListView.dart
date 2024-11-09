import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/widgets/task_item.dart';

import '../Cubits/tasks_cubit/tasks_cubit.dart';
import '../models/TaskModel.dart';
class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TasksCubit>(context).tasks!;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount:  tasks.length ,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TaskItem(task: tasks[index]),
                );
              }),
        );
      },
    );
  }
}
