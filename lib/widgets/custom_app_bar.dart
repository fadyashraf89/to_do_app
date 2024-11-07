import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(title, style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),),
          ),
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0.1),
    );
  }
}