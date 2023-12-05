import 'package:flutter/material.dart';


class calculatorbm extends StatelessWidget {
   final double?bmiresult;
   calculatorbm({this.bmiresult});

   @override

  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Calculated Value'),
     ),
     body:  Center(
       child: Container(
         color: Colors.blue,
              height:200 ,
              width:300 ,

         child: Column(
           children: [
             SizedBox(height: 60,),
             Text('Calculated BMI :',style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
             SizedBox(height: 15,),
             Text(
                 bmiresult?.toStringAsFixed(2) ?? "Enter Value",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),
             )
           ],
         ),
       ),
     ),
   );
  }
}
