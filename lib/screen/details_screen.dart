import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../business_logic/data.dart';
import '../model/task.dart';

class Details extends StatelessWidget {
  Details({Key? key, this.task}) : super(key: key);
  final Task? task;
  String? newText;
  Function? save(BuildContext context) {
    Provider.of<Data>(context, listen: false)
        .updateItem(task: task!, newTitle: newText ?? task!.title);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<Data>(context, listen: false)
            .updateItem(task: task!, newTitle: newText ?? task!.title);
        return true;
      },
      child: Scaffold(
        // resizeToAvoidBottomPadding: true,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'SAVE',
            onPressed: () {
              save(context);
            },
          ),
          title: const Text("Edit Task"),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 32),
              icon: const Icon(
                Icons.save,
                size: 32,
              ),
              tooltip: 'SAVE',
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "saved",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blueGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Provider.of<Data>(context, listen: false)
                    .updateItem(task: task!, newTitle: newText ?? task!.title);
                Navigator.pop(context);
              },
            ),
          ],
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
            ],
          ),
        ),
      ),
    );
  }
}
