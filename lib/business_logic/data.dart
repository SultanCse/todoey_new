import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/task.dart';

// final titles = ['buy milk', 'buy bilk', 'buy cow'];

class Data extends ChangeNotifier {
  static List<String> titles = [];
  static List<Task> _items = [];

  void loadTitles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    titles = prefs.getStringList('tasks') ?? ['demo item'];
    print(titles);
    _items = titles.map((value) => Task(title: value)).toList();
    notifyListeners();
  }

  UnmodifiableListView<Task> get items {
    return UnmodifiableListView(_items);
  }

  void addItems(Task task) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    titles.add(task.title);
    prefs.setStringList('tasks', titles);
    _items.add(task);
    notifyListeners();
  }

  void statusToggle(Task task) {
    task.toggle();
    notifyListeners();
  }

  void removeItems(Task task) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    titles.remove(task.title);
    prefs.setStringList('tasks', titles);
    _items.remove(task);
    notifyListeners();
  }

  int get length {
    return _items.length;
  }
}
