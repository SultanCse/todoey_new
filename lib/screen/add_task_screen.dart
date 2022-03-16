import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business_logic/data.dart';
import '../model/task.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? taskTitle;
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                taskTitle = value;
              },
              // maxLines: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Provider.of<Data>(context, listen: false).addItems(Task(title: taskTitle!));
                Navigator.pop(context);
              },
              child: const Text(
                "ADD",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
