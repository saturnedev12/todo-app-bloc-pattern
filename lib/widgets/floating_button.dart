import 'package:flutter/material.dart';

import 'modal_bottom.dart';

class TodoFloatingButton extends StatelessWidget {
  const TodoFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primaryVariant,
      onPressed: () {
        showAddForm(context);
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
