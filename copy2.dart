import 'package:flutter/material.dart';

class DataModel1 {
  String name, email, phone, password;
  DataModel1({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
}

class LoginDetails extends StatelessWidget {
  final DataModel1 datamodels;
  LoginDetails({required this.datamodels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Detail')),
      body: Column(
        children: [
          Container(
              height: 70,
              width:390,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Center(
                  child: Text('Name: ${datamodels.name}',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,),
                  ),
                ),
                  elevation: 30,
                  color: Colors.yellowAccent ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                ),
              )
          ),
          SizedBox(height: 10,),

          Container(
            height: 70,
            width:390,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(child: Center(
                child: Text('Email: ${datamodels.email}',
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,),),
              ),
                elevation: 30,
                color: Colors.lightGreen ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),

              ),

            ),
          ),
          SizedBox(height: 10,),
          Container(
              height: 70,
              width:390,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(child: Center(
              child: Text('Phone Number: ${datamodels.phone}',
                style:TextStyle(fontWeight: FontWeight.w300,fontSize: 20,) ,
              ),
            ),
              elevation: 30,
              color: Colors.yellowAccent ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),

            ),
          )),
          SizedBox(height: 10,),
          Container(
              height: 70,
              width:390,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Center(
                    child: Text('Password: ${datamodels.password}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,),),
                  ),
                  elevation: 30,
                  color: Colors.lightGreen ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                ),
              )),
        ],
      ),
    );
  }
}
