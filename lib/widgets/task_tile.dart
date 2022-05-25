import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String taskTitle;

  const TaskTile({required this.taskTitle});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(
        widget.taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: CustomCheckBox(
        isChecked: isChecked,
        onCheckClicked: (bool? newClickValue) {
          setState(() {
            isChecked = newClickValue!;
          });
        },
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?) onCheckClicked;

  const CustomCheckBox({required this.isChecked, required this.onCheckClicked});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isChecked,
      onChanged: onCheckClicked,
    );
  }
}
