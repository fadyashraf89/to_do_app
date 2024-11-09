import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/tasks_cubit/tasks_cubit.dart';
import 'package:to_do_app/widgets/TasksListView.dart';

import 'custom_app_bar.dart';

class TasksPageBody extends StatefulWidget {
  const TasksPageBody({super.key});

  @override
  State<TasksPageBody> createState() => _TasksPageBodyState();
}

class _TasksPageBodyState extends State<TasksPageBody> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).fetchAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: "To Do List",
        ),
      ),
      body: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          if (state is TasksSuccess) {
            return Column(
              children: const [
                Expanded(
                  child: TasksListView(),
                ),
              ],
            );
          } else if (state is TasksEmpty) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'No tasks available',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
