import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/bloc/task_cubit.dart';

void showAddForm(BuildContext context) {
  TextEditingController taskController = new TextEditingController();
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(minHeight: 200),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Container(
                    width: 350,
                    height: 65,
                    child: TextFormField(
                      //maxLength: 30,
                      maxLength: 25,
                      controller: taskController,
                      cursorColor: Theme.of(context).colorScheme.onPrimary,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onSecondary,
                        hintText: 'Enter yor task ...',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (taskController.text.isNotEmpty)
                      TaskCubit().createTask(
                        title: taskController.text,
                        date: DateFormat('d/M/y').format(DateTime.now()),
                        finish: false,
                      );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 320,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text('ADD NEW TASK'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            left: 10,
            right: 10,
            top: 10,
          ),
        );
      });
}
