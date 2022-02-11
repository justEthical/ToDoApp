import 'package:aitra_todo/Screens/add_todo_screen/add_todo.dart';
import 'package:aitra_todo/Screens/todo_list_screen/Widgets/app_bar.dart';
import 'package:aitra_todo/Screens/todo_list_screen/Widgets/big_text.dart';
import 'package:aitra_todo/Screens/todo_list_screen/Widgets/categories.dart';
import 'package:aitra_todo/Screens/todo_list_screen/Widgets/todos.dart';
import 'package:aitra_todo/adapters/todo_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => const AddTodo()));
          },
          child: const Icon(Icons.add)),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            CustomAppBar(),
            BigText(),
            Categories(),
            Expanded(child: TodosView())
          ],
        ),
      ),
    );
  }
}
