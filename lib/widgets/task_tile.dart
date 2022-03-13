import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key, this.title = "title"}) : super(key: key);
  final String title;
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool taskDone = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: taskDone ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: CheckTask(
        checked: taskDone,
        onChecked: (value) {
          setState(() {
            taskDone = value!;
          });
        },
      ),
    );
  }
}

class CheckTask extends StatelessWidget {
  const CheckTask({Key? key, this.onChecked, this.checked = false}) : super(key: key);
  final void Function(bool?)? onChecked;
  final bool checked;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked,
      // onChanged: (value) {
      //   checked = value!;
      //   onChecked!(checked);
      // },
      onChanged: onChecked,
    );
  }
}
