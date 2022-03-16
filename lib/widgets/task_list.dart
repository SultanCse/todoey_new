import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_new/widgets/task_tile.dart';

import '../business_logic/data.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, data, child) {
      return ListView.builder(
        itemCount: data.items.length,
        itemBuilder: (context, index) {
          return TaskTile(
              title: data.items[index].title,
              taskDone: data.items[index].isDone,
              onChecked: (val) {
                data.statusToggle(data.items[index]);
              });
        },
      );
    });
  }
}
