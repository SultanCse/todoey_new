import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business_logic/data.dart';
import 'screen/task_screen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => Data(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskScreen(),
    );
  }
}
