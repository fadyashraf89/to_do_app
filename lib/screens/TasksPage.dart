import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/TasksPageBody.dart';

import '../widgets/add_task_bottom_sheet.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  static String id = "Tasks";

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddTaskBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const TasksPageBody(),
    );
  }
}

