import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';

class TaskView extends StatefulWidget {
  final List<Task> baseTaskList;

  const TaskView({required this.baseTaskList});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = widget.baseTaskList;

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
