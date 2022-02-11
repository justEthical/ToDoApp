import 'package:aitra_todo/adapters/todo_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodosView extends StatefulWidget {
  const TodosView({ Key? key }) : super(key: key);

  @override
  _TodosViewState createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Todo>('todos').listenable(),
      builder: (context, Box<Todo> box, _) {
        if (box.values.isEmpty) {
          return const Center(
              child: Text(
            "No data available!",
            style: TextStyle(fontFamily: 'Montserrat')),
          );
        }
        return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              Todo todo = box.getAt(index)!;
              return Dismissible(
                  onDismissed: (direction) async {
                    await box.deleteAt(index);
                  },
                  key: Key(todo.title!),
                  child: _taskTile(todo));
              // return ListTile(
              //   onLongPress: () async {
              //     await box.deleteAt(index);
              //   },
              //   title: Text(
              //     todo.title!,
              //     style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
              //   ),
              //   subtitle: Text(
              //     todo.done.toString(),
              //     style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
              //   ),
              // );
            });
      },
    );
  }

  _taskTile(task) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.1)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              task.done = !task.done;
              setState(() {});
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: task.done
                      ? Colors.grey.withOpacity(0.7)
                      : Colors.transparent,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                task.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20,
                    color:
                        task.done ? Colors.grey.withOpacity(0.7) : Colors.black,
                    decoration: task.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ))
        ],
      ),
    );}
}