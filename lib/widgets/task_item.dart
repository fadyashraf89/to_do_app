import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:to_do_app/Cubits/tasks_cubit/tasks_cubit.dart";
import "package:to_do_app/models/TaskModel.dart";

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(task.color),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 16, top: 10, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  task.subTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.date,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        task.delete();
                        BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.white,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
