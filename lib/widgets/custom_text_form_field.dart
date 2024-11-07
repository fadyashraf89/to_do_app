import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String HintText;
  final int MaxLines;
  final void Function(String?)? onSaved;

  const CustomTextField({super.key, required this.HintText, required this.MaxLines, this.onSaved});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      maxLines: MaxLines,
      cursorColor: Colors.black.withOpacity(0.5),
      decoration: InputDecoration(
        hintText: HintText,
        border: buildBorder(Colors.black.withOpacity(0.5)),
        enabledBorder: buildBorder(Colors.black.withOpacity(0.5)),
        focusedBorder: buildBorder(Colors.black.withOpacity(0.5)),
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
    );
  }
  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.black,
        ));
  }
}