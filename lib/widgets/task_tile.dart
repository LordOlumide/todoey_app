import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked;
  final String taskTitle;
  final Function toggle;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: (bool? newValue) {
            toggle();
          },
        ));
  }
}
