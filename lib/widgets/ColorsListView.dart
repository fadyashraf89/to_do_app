import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubits/add_task_cubit/AddTaskCubit.dart';
class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
      radius: 25,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color,
      ),
    )
        : CircleAvatar(
      radius: 25,
      backgroundColor: color,
    );
  }
}
class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffAC3931),
    Color(0xffE5D352),
    Color(0xffD9E76C),
    Color(0xff537D8D),
    Color(0xff7ED4AD),
    Color(0xffD76C82),
    Color(0xffB03052),
    Color(0xff3D0301),
    Color(0xff9B6A6C),
    Color(0xff424B54),
    Color(0xff93A8AC),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddTaskCubit>(context).color = colors[index];

                  setState(() {});
                },
                child: ColorItem(
                  color: colors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}