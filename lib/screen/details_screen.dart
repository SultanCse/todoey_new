import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../business_logic/data.dart';
import '../model/task.dart';

class Details extends StatelessWidget {
  Details({Key? key, this.task}) : super(key: key);
  final Task? task;
  String? newText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: "${task?.title}",
                maxLines: 12,
                style: GoogleFonts.abel(
                  textStyle: const TextStyle(fontSize: 32),
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  newText = text;
                },
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                  ),
                  onPressed: () {
                    Provider.of<Data>(context, listen: false)
                        .updateItem(task: task!, newTitle: newText ?? task!.title);
                    // Provider.of<Data>(context, listen: false).loadTitles();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
