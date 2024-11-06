import "package:flutter/material.dart";
import "package:to_do_app/screens/TasksPage.dart";
import "package:to_do_app/screens/login_page.dart";
void main(){
  runApp(const TodoApp());
}
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        TasksPage.id: (context) => const TasksPage(),

      },      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light
      ),
    );
  }
}


