import 'package:flutter/material.dart';

class Listsecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arrnumber = ['Rohan' ,'Harish','Simran','Nidhi','Payal','Mohan','Suresh'];
    return Scaffold(
        appBar: AppBar(title: Text('Simple ListView Example')),
        body: ListView.separated(itemBuilder: (context, index) {
          return Text(arrnumber[index] ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),);
        },
          itemCount: arrnumber.length,
          separatorBuilder: (contex,index){
          return Divider(height: 5,thickness: 5,);
          },

        )
    );
  }
}