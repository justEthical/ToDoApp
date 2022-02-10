import 'package:aitra_todo/Screens/todo_list_screen/todo_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "todoApp list",
      theme: ThemeData(
        
        primarySwatch: Colors.grey,
      ),
      home: const TodoListScreen(),
    );
  }
}

