import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/constantes.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/widgets/task_card.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box("TASKS").listenable(),
      builder: (context, box, child) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 7, right: 7, top: 5),
            child: Column(
              children: box.values
                  .map<Widget>((e) => TaskCard(
                        task: e,
                        title: e.title,
                        date: e.date,
                        finish: e.finish,
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
