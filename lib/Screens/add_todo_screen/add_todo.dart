import 'package:aitra_todo/adapters/todo_adapter.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController task = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            var tsk = task.text;
            if (tsk != '' && tsk != null) {
              _submitTodo(tsk);
            }
          },
          child: Text("save todo")),
      body: Column(
        children: [_topBar(), _addTodoTextField()],
      ),
    );
  }

  _submitTodo(task) {
    Box<Todo> todoBox = Hive.box<Todo>('todos');
    todoBox.add(Todo(title: task, done: false));
    Navigator.of(context).pop();
  }

  _topBar() {
    return Container(
      padding: const EdgeInsets.only(right: 30, top: 50),
      child: Row(
        children: [
          Expanded(child: Container()),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }

  _addTodoTextField() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: TextField(
          controller: task,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey.withOpacity(0.1)),
          decoration: const InputDecoration(
              border: InputBorder.none,
              //labelText: 'Enter Name',
              hintText: 'Enter New Task'),
        ),
      ),
    ));
  }
}
