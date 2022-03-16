import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, this.onChecked, this.taskDone = false, this.title = 'title'})
      : super(key: key);
  final void Function(bool?)? onChecked;
  final bool taskDone;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: taskDone ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: Checkbox(
        value: taskDone,
        onChanged: onChecked,
      ),
    );
  }
}
