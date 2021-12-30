import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/bloc/task_cubit.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/widgets/body.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
    return AnimatedContainer(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(top: 10),
      duration: Duration(seconds: 1),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  log("tap");
                  TaskCubit().deleteTask(task);
                },
                child: Container(
                  height: double.infinity - 1,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(5),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryVariant,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  shape: CircleBorder(),
                  value: finish,
                  fillColor: MaterialStateProperty.all(Colors.green),
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
        ),
      ),
    );
  }
}
