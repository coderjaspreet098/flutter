import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.directions_bike,
                  ),
                ),
                Tab(icon: Icon(Icons.directions_car)),
                Tab(
                  icon: Icon(Icons.directions_transit),
                )
              ],
            ),
            title: Text('Information About Routes'),
          ),
          body: TabBarView(
            children: [
              Center(
                  child: Text(
                '60min',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
              Center(
                  child: Text(
                '20min',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
              Center(
                  child: Text(
                '1hr10min',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
