import 'package:flutter/material.dart';
import 'package:todoey/models/task_list_object.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListObject>(builder: (context, taskObject, child) {
      List<Task> tasks = taskObject.baseTaskList;
      return ListView.builder(
        padding: const EdgeInsets.only(top: 15.0),
        itemCount: taskObject.taskCount,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return TaskTile(
              taskTitle: task.title,
              isChecked: task.isDone,
              toggleCallback: () {
                taskObject.toggleTaskState(task);
              },
              longPressCallback: () {
                taskObject.removeTask(task);
              });
        },
      );
    });
  }
}
