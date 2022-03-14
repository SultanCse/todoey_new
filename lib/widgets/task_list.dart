import 'package:flutter/material.dart';
import 'package:todoey_new/widgets/task_tile.dart';

import '../model/task.dart';

class TaskList extends StatefulWidget {
  TaskList({Key? key, required this.items}) : super(key: key);
  List<Task> items;
  // List<Task> items = [
  //   Task(title: "buy milk"),
  //   Task(title: "buy a cow"),
  // ];
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return TaskTile(
          title: widget.items[index].title,
          taskDone: widget.items[index].isDone,
          onChecked: (value) {
            setState(
              () {
                // items[index].isDone = value!;
                // or
                widget.items[index].toggle();
              },
            );
          },
        );
      },
    );
    //   ListView(
    //   children: [
    //     TaskTileTest(title: list[0].title),
    //     TaskTileTest(title: list[1].title),
    //   ],
    // );
  }
}
