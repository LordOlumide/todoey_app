import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/screens/tasks_screen.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addNewTask;

  const AddTaskScreen({Key? key, required this.addNewTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTask = '';

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: kAddTaskScreenDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                newTask = value;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              onPressed: () {
                if (newTask != '') {
                  addNewTask(newTask);
                }
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
