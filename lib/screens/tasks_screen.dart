import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 50,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
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
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class TaskTile extends StatefulWidget {
  final String taskTitle;

  const TaskTile({
    Key? key,
    required this.taskTitle,
  }) : super(key: key);

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
          setState(() {
            print(newValue);
          });
        }),
      ),
    );
  }
}
