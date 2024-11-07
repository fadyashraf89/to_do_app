import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/custom_app_bar.dart';
import 'package:to_do_app/widgets/task_item.dart';

import '../widgets/add_task_bottom_sheet.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  static String id = "Tasks";

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar(
          title: "To Do List",
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return const TaskItem();
      }),
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
    );
  }
}
