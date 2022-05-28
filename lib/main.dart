import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'models/task_list_object.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //TODO: How to persist the state.

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
