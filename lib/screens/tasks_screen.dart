import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_view.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Task> baseTaskList = [
    Task(title: 'Eat food'),
    Task(title: 'Get babes'),
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
        child: const Icon(Icons.add),
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
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 50,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Todoey',
                  style: kBigTitleTextStyle,
                ),
                Text(
                  '${baseTaskList.length} tasks',
                  style: kSmallTitleTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: kBottomContainerDecoration,
              child: TaskView(baseTaskList: baseTaskList),
            ),
          ),
        ],
      )),
    );
  }
}
