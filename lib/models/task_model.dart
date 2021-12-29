import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  bool? finish;

  @HiveField(2)
  String? date;
}
