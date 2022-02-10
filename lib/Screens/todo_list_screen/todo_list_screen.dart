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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _topBar(),
            _bigText(),
            //_categories()
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
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.only(left: 30, top: 20),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            //color: Colors.red,
            child: Text(
              "CATEGORIES",
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ),

          ListView()
        ],

      
      ),
    );
  }
}
