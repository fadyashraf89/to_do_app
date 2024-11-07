import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/add_task_cubit/AddTaskCubit.dart';
import 'package:to_do_app/Cubits/add_task_cubit/add_task_state.dart';

import 'AddTaskForm.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => AddTaskCubit(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<AddTaskCubit, AddTaskState>(
              listener: (context, state) {
                if (state is AddTaskFailed) {
                  print('failed  ${state.errorMessage}');
                }
                if (state is AddTaskSuccess) {
                  print("State et3amalet");
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return AbsorbPointer(
                    absorbing: state is AddTaskLoading ? true : false,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const SingleChildScrollView(
                        child: AddTaskForm(),
                      ),
                    ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
