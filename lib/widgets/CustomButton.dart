import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.isLoading = false});

  final void Function()? onPressed;

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(
              8,
            )),
        child: Center(
          child: isLoading
              ? const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
              : const Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}