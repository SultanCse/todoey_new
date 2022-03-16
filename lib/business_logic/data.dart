import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../model/task.dart';

class Data extends ChangeNotifier {
  final List<Task> _items = [
    Task(title: "buy milk"),
    Task(title: "buy milk"),
    Task(title: "buy a cow"),
  ];
  UnmodifiableListView<Task> get items {
    return UnmodifiableListView(_items);
  }

  void addItems(Task task) {
    _items.add(task);
    notifyListeners();
  }

  void statusToggle(Task task) {
    task.toggle();
    notifyListeners();
  }

  void removeItems(Task task) {
    _items.remove(task);
    notifyListeners();
  }

  int get length {
    return items.length;
  }
}
