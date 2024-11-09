// ignore_for_file: unused_import

import "package:flutter/material.dart";
import "package:to_do_app/Cubits/add_task_cubit/AddTaskCubit.dart";
import "package:to_do_app/Cubits/tasks_cubit/tasks_cubit.dart";
import "package:to_do_app/screens/TasksPage.dart";
import "package:to_do_app/screens/login_page.dart";
import 'package:hive_flutter/adapters.dart';
import "SimpleBlocObserver.dart";
import "models/TaskModel.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TaskModelAdapter());
  }
  Bloc.observer = SimpleBlocObserver();
  await Hive.openBox<TaskModel>("Tasks_Box");

  runApp(const TodoApp());
}
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TasksCubit(),
    child: MaterialApp(
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => const LoginPage(),
          TasksPage.id: (context) => const TasksPage(),
      
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light
        ),
      ),
    );
  }
}


