import 'package:flutter/material.dart';
import 'package:todoey/models/task_list_object.dart';
import 'package:todoey/widgets/tasks_view.dart';
import 'package:todoey/constants.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
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
                child: AddTaskScreen(),
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
                const SizedBox(height: 12.0),
                const Text(
                  'Todoey',
                  style: kBigTitleTextStyle,
                ),
                Text(
                  '${context.watch<TaskListObject>().taskCount} tasks',
                  style: kSmallTitleTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: kBottomContainerDecoration,
              child: TaskView(),
            ),
          ),
        ],
      )),
    );
  }
}
