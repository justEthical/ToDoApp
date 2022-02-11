import 'package:aitra_todo/Screens/add_todo_screen/add_todo.dart';
import 'package:flutter/material.dart';

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
          children: [_topBar(), _bigText(), _categories()],
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
}
