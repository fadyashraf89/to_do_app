import 'package:hive/hive.dart';
part 'TaskModel.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;
  TaskModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}