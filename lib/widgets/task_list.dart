import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:todoey_new/model/task.dart';
import 'package:todoey_new/widgets/task_tile.dart';

import '../business_logic/data.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, data, child) {
      // here data =Provider.of<Data>(context)
      return ListView.builder(
        itemCount: data.items.length,
        itemBuilder: (context, index) {
          Task item = data.items[index];
          return FocusedMenuHolder(
            menuItemExtent: 100,
            // blurSize: 10,
            menuBoxDecoration: BoxDecoration(
              border: Border.all(color: Colors.black45, width: 2),
            ),
            duration: Duration(seconds: 1),
            menuItems: [
              FocusedMenuItem(
                  title: const Text(
                    "Remove",
                    style: TextStyle(fontSize: 32, color: Colors.redAccent),
                  ),
                  trailingIcon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 32,
                  ),
                  onPressed: () {
                    data.removeItems(data.items[index]);
                  }),
              FocusedMenuItem(
                title: const Text(
                  "Edit",
                  style: TextStyle(fontSize: 32, color: Colors.green),
                ),
                trailingIcon: const Icon(
                  Icons.edit,
                  size: 32,
                  color: Colors.green,
                ),
                onPressed: () {},
              ),
            ],
            onPressed: () {},
            child: TaskTile(
              title: item.title,
              taskDone: item.isDone,
              onChecked: (val) {
                data.statusToggle(item);
              },
              // onLongPress: () {
              //   data.removeItems(data.items[index]);
              // },
            ),
          );
        },
      );
    });
  }
}
