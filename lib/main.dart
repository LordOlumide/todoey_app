import 'dart:io';

import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'models/task_list_object.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  

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
