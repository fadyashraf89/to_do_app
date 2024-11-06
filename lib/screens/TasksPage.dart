import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/custom_app_bar.dart';
import 'package:to_do_app/widgets/task_item.dart';
class TasksPage extends StatefulWidget {
  const TasksPage({super.key});
  static String id = "Tasks";

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar(
          title: "To Do List",
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return TaskItem();
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          AddNoteDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> AddNoteDialog(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            child: const Text('Submit'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
