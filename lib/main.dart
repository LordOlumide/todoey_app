import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'models/task.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListObject>(
      create: (context) => TaskListObject(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

class TaskListObject extends ChangeNotifier {
  final List<Task> baseTaskList = [
    Task(title: 'Eat food'),
    Task(title: 'Get babes'),
    Task(title: 'Do good'),
  ];

  void addTask(Task newTask) {
    baseTaskList.add(newTask);
    notifyListeners();
  }
}
