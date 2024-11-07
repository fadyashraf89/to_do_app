import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_form_field.dart';
class EditTask extends StatelessWidget {
  const EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CustomAppBar(
          title: "Edit Note",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CustomTextField(
                MaxLines: 1,
                HintText: 'Title',
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                MaxLines: 10,
                HintText: 'Task Details',
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Submit"),
                onPressed: (){

                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
