import 'package:aitra_todo/Screens/todo_list_screen/todo_list_screen.dart';
import 'package:flutter/material.dart';
//import 'package:aitra_todo/adapters/todo_adapter.g.dart';
import 'package:aitra_todo/adapters/todo_adapter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
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
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}
