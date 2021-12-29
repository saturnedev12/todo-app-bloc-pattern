import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/models/task_model.dart';

class TaskCubit extends Cubit<int> {
  TaskCubit() : super(0);

  void createTask(
      {required String title, required String date, required bool finish}) {
    TaskModel _newTask = new TaskModel();
    _newTask.title = title;
    _newTask.date = date;
    _newTask.finish = false;
    Hive.box("TASKS").add(_newTask);
    emit(state + 1);
  }

  void finishTask(TaskModel task) {
    TaskModel _newTask = new TaskModel();
    _newTask = task;
    _newTask.finish = !task.finish!;
    Hive.box("TASKS").put(task.key, _newTask);
    emit(state + 1);
  }

  void deleteTask(TaskModel task) async {
    log(task.key.toString());
    await Hive.box("TASKS").delete(task.key);
    emit(state + 1);
  }
}
