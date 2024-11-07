import "package:flutter/material.dart";
import "package:to_do_app/screens/EditTask.dart";
class TaskItem extends StatefulWidget {
  const TaskItem({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? check = false;  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black. withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 16, top: 10, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const ListTile(
              title: Text(
                'Task',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Details Of Task',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Edit Task"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const EditTask();
                      }),
                    );
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Mark as done"),
                  onPressed: (){

                  },
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16, top: 10),
              child: Text(
                'May 21,2022',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
