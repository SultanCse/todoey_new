import 'package:flutter/material.dart';

class SharedPref extends StatelessWidget {
  const SharedPref({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: const Text(
        "sharedPrefData",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
