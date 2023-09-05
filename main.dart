
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/series6.dart';
import 'package:newproject/series7.dart';
import 'series2.dart';
import 'list_part2.dart';

import 'Scroll_list.dart';
import 'list_view.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
     title: 'List View',
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: MyHomePage(),
   );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child:Column(
          children: [ ElevatedButton(
              child: Text('ListView.builder'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed:
                  () =>   Navigator.push(context,
                MaterialPageRoute(builder: (context) => SimpleListViewScreen()),
              )
          ),
            OutlinedButton(
                child: Text('Listview.separated'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed:
                    () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Listsecond()
                  ),
                )
            ),
            OutlinedButton(
                child: Text('Scroll list'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent ,
                ),
                onPressed:
                    () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Scrolllist()
                  ),
                )
            ),
            OutlinedButton(
                child: Text('Login Page'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed:
                    () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginApp1()
                  ),
                )
            ),
            OutlinedButton(
                child: Text('pick image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent ,
                ),
                onPressed:
                    () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImagePickerWidget()
                  ),
                )
            ),
            OutlinedButton(
                child: Text('Date and Time Picker'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed:
                    () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyDateTimePicker()
                  ),
                )
            ),



          ],

        )
      ),

    );
  }
}