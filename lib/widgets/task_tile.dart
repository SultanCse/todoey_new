import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {Key? key, this.onChecked, this.taskDone = false, this.title = 'title', this.onLongPress})
      : super(key: key);
  final void Function(bool?)? onChecked;
  final void Function()? onLongPress;
  final bool taskDone;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: taskDone
            ? GoogleFonts.abel(
                fontSize: 32, decoration: TextDecoration.lineThrough, color: Colors.grey)
            : GoogleFonts.abel(fontSize: 32),
      ),
      trailing: Checkbox(
        value: taskDone,
        onChanged: onChecked,
      ),
      onLongPress: onLongPress,
    );
  }
}
