import 'package:flutter/cupertino.dart';

import '../model/task.dart';

class Data extends ChangeNotifier {
  List<Task> items = [
    Task(title: "buy milk"),
    Task(title: "buy milk"),
    Task(title: "buy a cow"),
  ];
  void addItems(Task task) {
    items.add(task);
    notifyListeners();
  }

  void statusToggle(Task task) {
    task.toggle();
    notifyListeners();
  }

  int length() {
    return items.length;
  }
}
