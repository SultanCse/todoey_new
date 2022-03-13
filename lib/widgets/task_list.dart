import 'package:flutter/material.dart';
import 'package:todoey_new/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TaskTile(title: "milk 5 litter"),
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}
