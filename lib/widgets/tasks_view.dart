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
          return TaskTile(
            taskTitle: tasks[index].title,
            isChecked: tasks[index].isDone,
            toggle: () {
              taskObject.toggleTaskState(index);
            },
          );
        },
      );
    });
  }
}
