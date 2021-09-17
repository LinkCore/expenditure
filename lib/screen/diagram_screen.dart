import 'package:flutter/material.dart';

class DiagramExpenditureScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiagramExpenditureScreenState();
  }
}

class _DiagramExpenditureScreenState extends State<DiagramExpenditureScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Diagram Screen"),
        ),
        body: Container(
            height: 70,
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15),
            )));
  }
}
