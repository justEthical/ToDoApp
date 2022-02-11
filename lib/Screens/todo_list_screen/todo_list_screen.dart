import 'package:aitra_todo/Screens/add_todo_screen/add_todo.dart';
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
          child: Icon(Icons.add)),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _topBar(),
            _bigText(),
            _categories(),
            Expanded(child: _todoList())
          ],
        ),
      ),
    );
  }

  _topBar() {
    return Container(
      padding: const EdgeInsets.all(17),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          const Expanded(
            child: SizedBox(),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notification_add_outlined))
        ],
      ),
    );
  }

  _bigText() {
    return Container(
        width: MediaQuery.of(context).size.width,
        //color: Colors.blue,
        padding: const EdgeInsets.only(left: 30),
        child: const Text(
          "What's up, Joy!",
          style: TextStyle(
              fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
        ));
  }

  _categories() {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      height: 180,
      //color: Colors.green,
      //padding: const EdgeInsets.only(left: 30, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: w - 30,
            padding: EdgeInsets.only(left: 25, top: 10),
            //color: Colors.red,
            child: const Text(
              "CATEGORIES",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Expanded(
          //     child: Container(
          //   padding: EdgeInsets.only(
          //     left: 30,
          //   ),
          //   child: Row(
          //     children: [
          //       Card(
          //           elevation: 5,
          //           child: Container(
          //               width: 170, height: 150, color: Colors.redAccent)),
          //       Card(
          //           elevation: 5,
          //           child: Container(
          //             width: 170,
          //             height: 150,
          //             color: Colors.blue,
          //           ))
          //     ],
          //   ),
          // ))

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListView(
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: [
                  Card(
                      elevation: 5,
                      child: Container(
                          width: 170, height: 150, color: Colors.redAccent)),
                  Card(
                      elevation: 5,
                      child: Container(
                        width: 170,
                        height: 150,
                        color: Colors.blue,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _todoList() {
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
    );
  }
}
