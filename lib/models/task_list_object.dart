import 'task.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class TaskListObject extends ChangeNotifier {
  final List<Task> _baseTaskList = [
    Task(title: 'Eat food'),
    Task(title: 'Get babes'),
    Task(title: 'Do good'),
  ];

  UnmodifiableListView<Task> get baseTaskList {
    return UnmodifiableListView<Task>(_baseTaskList);
  }

  int get taskCount {
    return _baseTaskList.length;
  }

  void toggleTaskState(int index) {
    _baseTaskList[index].toggleTaskState();
    notifyListeners();
  }

  void addTask(String newTask) {
    _baseTaskList.add(Task(title: newTask));
    notifyListeners();
  }
}
