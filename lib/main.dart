import "package:flutter/material.dart";
import "package:to_do_app/screens/TasksPage.dart";
void main(){
  runApp(const TodoApp());
}
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: TasksPage(),
    );
  }
}


