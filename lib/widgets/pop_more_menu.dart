import 'package:flutter/material.dart';
import 'package:todolist/bloc/task_cubit.dart';

enum _ActionsMenu {
  SELECT_ALL,
  DESELECT_ALL,
  DELETE_ALL,
}

class PopMoreMenu extends StatelessWidget {
  const PopMoreMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      icon: Icon(
        Icons.more_vert,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: _ActionsMenu.SELECT_ALL,
          child: Text('Select All'),
        ),
        const PopupMenuItem(
          value: _ActionsMenu.DESELECT_ALL,
          child: Text('Desect All'),
        ),
        const PopupMenuItem(
          value: _ActionsMenu.DELETE_ALL,
          child: Text('Delete All'),
        ),
      ],
      onSelected: (value) {
        print(value);
        _selectedActions(value!);
      },
    );
  }
}

void _selectedActions(Object action) {
  if (action == _ActionsMenu.SELECT_ALL) {
    TaskCubit().finishAll();
  } else if (action == _ActionsMenu.DESELECT_ALL) {
    TaskCubit().rollBackfinishAll();
  } else if (action == _ActionsMenu.DELETE_ALL) {
    TaskCubit().deleteAllTask();
  }
}
