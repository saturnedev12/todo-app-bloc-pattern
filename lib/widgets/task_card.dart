import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/bloc/task_cubit.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/widgets/body.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
    Key? key,
    required this.title,
    required this.date,
    required this.finish,
    required this.task,
  }) : super(key: key);
  String title;
  String date;
  bool finish;
  TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 5),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryVariant,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
              value: finish,
              onChanged: (val) {
                TaskCubit().finishTask(task);
              }),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
