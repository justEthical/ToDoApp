import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}