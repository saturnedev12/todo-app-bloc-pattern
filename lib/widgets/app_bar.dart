import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/bloc/theme_bloc.dart';
import 'package:todolist/events/theme_events.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/states/theme_states.dart';
import 'package:todolist/widgets/pop_more_menu.dart';

import 'custom_slider.dart';

class TodoAppBar extends StatelessWidget implements PreferredSize {
  TodoAppBar({Key? key}) : super(key: key);
  int _elementFinish = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryVariant,
          elevation: 0,
          leadingWidth: 200,
          leading: Center(
              child: Text(
            "Saturne Todos",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )),
          actions: [
            PopMoreMenu(),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      (state is ThemeLightState)
                          ? context.read<ThemeBloc>().add(ThemeDarkEvent())
                          : context.read<ThemeBloc>().add(ThemeLightEvent());
                    },
                    icon: (state is ThemeLightState)
                        ? Icon(
                            Icons.brightness_2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )
                        : Icon(
                            Icons.brightness_high,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ));
              },
            )
          ],
        ),
        Container(
          height: 20,
          padding: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          color: Theme.of(context).colorScheme.primaryVariant,
          child: ValueListenableBuilder<Box>(
            valueListenable: Hive.box("TASKS").listenable(),
            builder: (context, box, child) {
              double _boxlength = box.length.toDouble();
              double _elfinish = 0;
              List<TaskModel> _listTaskFinish = [];

              box.values.forEach((element) {
                if (element.finish) _listTaskFinish.add(element);
              });
              //inspect(box.length);
              //inspect(_listTaskFinish);
              return CusTomSlider(
                currentValue: _listTaskFinish.length.toDouble(),
                maxValue: _boxlength,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(85);
}
