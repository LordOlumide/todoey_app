import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_view.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}
class _TasksScreenState extends State<TasksScreen> {

  List<Task> baseTaskList = [
    Task(title: 'Buy weed'),
    Task(title: 'Buy booze'),
    Task(title: 'Do good'),
  ];

  void addTask(newTask) {
    setState(() {
      baseTaskList.add(Task(title: newTask));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(addNewTask: addTask),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, left: 40.0, right: 40.0, bottom: 40.0),
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
                  style: kBigTitleTextStyle,
                ),
                Text(
                  '12 tasks',
                  style: kSmallTitleTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: kBottomContainerDecoration,
              child: TaskView(baseTaskList: baseTaskList),
            ),
          ),
        ],
      )),
    );
  }
}
