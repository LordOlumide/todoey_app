import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String taskTitle;

  const TaskTile({required this.taskTitle});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.taskTitle),
      trailing: Checkbox(
        value: false,
        onChanged: ((bool? newValue) {
          // setState(() {
          //   print(newValue);
          // });
        }),
      ),
    );
  }
}
