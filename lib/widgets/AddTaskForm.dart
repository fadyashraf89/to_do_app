import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/add_task_cubit/add_task_state.dart';
import 'package:to_do_app/models/TaskModel.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/widgets/ColorsListView.dart';

import '../Cubits/add_task_cubit/AddTaskCubit.dart';
import 'CustomButton.dart';
import 'custom_text_form_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const Text(
            "Add New Task",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            HintText: 'Title',
            MaxLines: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            HintText: 'Details',
            MaxLines: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          ColorsListView(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddTaskCubit, AddTaskState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddTaskLoading ? true : false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();

                    var formattedCurrentDate =
                        DateFormat('yyyy-MM-dd').format(currentDate);
                    var Taskmodel = TaskModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate,
                        color: Colors.grey.value);
                    BlocProvider.of<AddTaskCubit>(context).AddTask(Taskmodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
