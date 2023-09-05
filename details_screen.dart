import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  DetailsScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              height: 70,
              width:350,
              child: Card(child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('First Name: ${userData['firstName']}',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),
                ),
              ),
              ),
                elevation: 30,
                color: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 70,
              width:350,
              child: Card(child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Last Name: ${userData['lastName']}',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),
                ),
              ),
              ),
                elevation: 30,
                color: Colors.lightGreen ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 70,
              width:350,
              child: Card(child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Mobile Number: ${userData['mobileNumber']}',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,
                  ),
                ),
              ),
              ),
                elevation: 30,
                color: Colors.lightGreen ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 70,
              width:350,
              child: Card(child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Email: ${userData['email']}',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),),
              )
              ),
                elevation: 30,
                color: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 70,
              width:350,
              child: Card(child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Password: ${userData['password']}',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),),
              )
              ),
                elevation: 30,
                color: Colors.lightGreen ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
 }
