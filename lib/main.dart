import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/todo_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: TodoScreen(),
    );
  }
}
