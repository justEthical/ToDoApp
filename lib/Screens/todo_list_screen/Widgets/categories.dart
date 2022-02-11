import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
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
