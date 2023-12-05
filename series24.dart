import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:newproject/series25.dart';

class Grocerystore extends StatefulWidget {
  @override
  _GrocerystoreState createState() => _GrocerystoreState();
}

class _GrocerystoreState extends State<Grocerystore> {
  int _currentIndex = 0;
  List<Widget> _listbottom =<Widget>[
   Grocerystore1(),
    Firstpage1(),
    Secondpage2(),
    Thirdpage2(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Laundry store'),
        ),
        body:_listbottom.elementAt(_currentIndex),

        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.location_on, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          color: Colors.blue,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.greenAccent,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            }
            );
          },
        ),
      ),
    );
  }
}

class Firstpage1 extends StatelessWidget {
  const Firstpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('First page');
  }
}

class Secondpage2 extends StatelessWidget {
  const Secondpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Secondpage');
  }
}

class Thirdpage2 extends StatelessWidget {
  const Thirdpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Thirdpage');
  }
}




