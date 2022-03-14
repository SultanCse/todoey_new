import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key, this.addTaskFun}) : super(key: key);
  final Function? addTaskFun;
  String? taskTitle;
  @override
  Widget build(BuildContext context) {
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
                addTaskFun!(taskTitle);
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
