import 'package:flutter/material.dart';
import 'package:todoey_new/widgets/task_tile.dart';

import '../model/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool val = false;
  List<Task> items = [Task(title: "buy milk"), Task(title: "buy milk"), Task(title: "buy a cow")];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return TaskTile(
          title: items[index].title,
          taskDone: items[index].isDone,
          onChecked: (value) {
            setState(
              () {
                // items[index].isDone = value!;
                // or
                items[index].toggle();
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
