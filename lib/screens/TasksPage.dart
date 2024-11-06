import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/custom_app_bar.dart';
import 'package:to_do_app/widgets/task_item.dart';
class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar(
          title: "To Do List",
        ),
      ),
      body: Expanded(
        child: ListView.builder(itemBuilder: (context, index) {
          return TaskItem();
        }),
      ),
    );
  }
}
