import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  List<String> taskList = [];
  List<bool> isCheckedList = List<bool>.filled(1000, false);

  String name1 = '';
  bool isDone1 = false;

  void taskName(name) {
    name1 = name;
    notifyListeners();
  }

  addTask() {
    notifyListeners();
    return taskList.add(name1);
  }

  void isChecked() {
    notifyListeners();
    isCheckedList;
  }

  void delete() {
    notifyListeners();
    taskList;
  }
}
