import 'package:expenditure/screen/diagram_screen.dart';
import 'package:expenditure/screen/expenditure_sceen.dart';
import 'package:flutter/material.dart';

import 'create_expenditure_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return _MyHomePageState();
  }
}


class _MyHomePageState extends State<MyHomePage> {

int _currentIndex = 0;
List<Widget> _children = [
  DiagramExpenditureScreen(),
  ExpenditureWidgetScreen(),
  CreateExpenditureScreen(),
];

void onTabTapped(int index){
  setState((){
    _currentIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
      currentIndex: _currentIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.analytics_outlined),
          title: new Text('Diagram'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.list_sharp),
          title: new Text('Expenditure'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.playlist_add_rounded),
          title: new Text('Create'),
        ),
      ],
    ),
    );
  }
}
