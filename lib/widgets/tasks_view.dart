import 'package:flutter/material.dart';
import 'package:todoey/main.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';

class TaskView extends StatefulWidget {
  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskListObject>(context).baseTaskList;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 15.0),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].title,
          isChecked: tasks[index].isDone,
          toggle: () {
            setState(() {
              tasks[index].toggleTaskState();
            });
          },
        );
      },
    );
  }
}
