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

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TaskListObject taskListObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskListObject = TaskListObject();
    taskListObject.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListObject>(
      create: (context) => taskListObject,
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
