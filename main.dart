

import 'package:flutter/material.dart';
//import 'package:newproject/series11.dart';
//import 'package:newproject/series14.dart';
//import 'package:newproject/series15.dart';
import 'package:newproject/series17.dart';
import 'package:newproject/series18.dart';
import 'package:newproject/series24.dart';
import 'package:newproject/series6.dart';

import 'package:newproject/series7.dart';
import 'package:newproject/series8.dart';

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
                  MaterialPageRoute(builder: (context) => Imagecropper()
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
            SizedBox(height: 30,),
            ElevatedButton(
                child:Text('BMI Calculate'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
              onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> bmicalculator()
              ),
              ),
            ),
            SizedBox(height: 15,),
            OutlinedButton(
                child: Text('Post Model'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed:
                    () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyApp5()
                  ),
                )
            ),
            SizedBox(height: 15,),
            OutlinedButton(
                child: Text('Drawer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed:
                    () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Demopage()
                  ),
                )
            ),
            SizedBox(height: 10,),
            OutlinedButton(
                child: Text('Laundry store'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed:
                    () =>   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Grocerystore()
                  ),
                )
            ),




          ],

        )
      ),

    );
  }
}