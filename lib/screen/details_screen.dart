import 'package:flutter/material.dart';

import '../model/task.dart';

class Details extends StatelessWidget {
  const Details({Key? key, this.task}) : super(key: key);
  final Task? task;
  final prefs = await SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: TextFormField(
          initialValue: "${task?.title}",
        ),
        // Text("${task?.title}"),
      ),
    );
  }
}
