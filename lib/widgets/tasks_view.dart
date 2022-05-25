import 'package:flutter/material.dart';
import 'task_tile.dart';

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 15.0),
      children: const [
        TaskTile(
          taskTitle: 'Task 1: Clean the kitchen',
        ),
        TaskTile(
          taskTitle: 'Task 2: Mow the lawn',
        ),
        TaskTile(
          taskTitle: 'Task 3: Do the dishes',
        ),
      ],
    );
  }
}
