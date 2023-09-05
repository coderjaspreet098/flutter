import 'package:flutter/material.dart';

class SimpleListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arrnames = ['Jass' ,'Megha','Ritu','Sonal'];
    return Scaffold(
      appBar: AppBar(title: Text('Simple ListView Example')),
      body: ListView.builder(itemBuilder: (context, index) {
        return Text(arrnames[index] ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),);
      },
        itemCount: arrnames.length,
        itemExtent: 200,
       // scrollDirection: Axis.horizontal,
      )
    );
  }
}
 