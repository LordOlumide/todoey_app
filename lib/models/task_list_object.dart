import 'task.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskListObject extends ChangeNotifier {
  late final prefs;
  List<Task> _baseTaskList = [];

  initialize() async {
    prefs = await SharedPreferences.getInstance();

    // Get the task names
    final List<String> initialNames =
        prefs.getStringList('initialStrings') ?? [];

    // Get the task states
    final List<String> initialStateStrings =
        prefs.getStringList('initialStates') ?? [];
    final List<bool> taskStates = [
      for (String i in initialStateStrings) i == 'true' ? true : false
    ];

    // Initialize the Task objects
    List<Task> initialTasks = [
      for (int i = 0; i < initialNames.length; i++)
        Task(title: initialNames[i], isDone: taskStates[i])
    ];

    // Add Task objects to baseTaskList
    _baseTaskList = [...initialTasks];
    notifyListeners();
  }

  UnmodifiableListView<Task> get baseTaskList {
    return UnmodifiableListView<Task>(_baseTaskList);
  }

  int get taskCount {
    return _baseTaskList.length;
  }

  void toggleTaskState(int index) async {
    _baseTaskList[index].toggleTaskState();
    await storeTaskStatesAgain();
    notifyListeners();
  }

  void addTask(String newTask) async {
    _baseTaskList.add(Task(title: newTask));
    await storeTaskNamesAgain();
    await storeTaskStatesAgain();
    notifyListeners();
  }

  void removeTask(task) async {
    _baseTaskList.remove(task);
    await storeTaskNamesAgain();
    await storeTaskStatesAgain();
    notifyListeners();
  }

  Future<void> storeTaskNamesAgain() async {
    await prefs.setStringList(
        'initialStrings', <String>[for (Task i in _baseTaskList) i.title]);
  }

  Future<void> storeTaskStatesAgain() async {
    await prefs.setStringList(
        'initialStates', <String>[for (Task i in _baseTaskList) '${i.isDone}']);
  }
}
