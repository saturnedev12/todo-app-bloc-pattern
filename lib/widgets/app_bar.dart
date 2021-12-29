import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/theme_bloc.dart';
import 'package:todolist/events/theme_events.dart';
import 'package:todolist/states/theme_states.dart';

class TodoAppBar extends StatelessWidget implements PreferredSize {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
