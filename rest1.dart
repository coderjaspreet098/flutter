import 'package:flutter/material.dart';
import 'package:untitled/getreq_model.dart';
class Restapi extends StatelessWidget {
  final Data restdata;
  Restapi({required this.restdata});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Information') ,),
      body:  Padding(

        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(

                width: 100,
                height: 100,
                child: Image.network(restdata.avatar),


              ),
              Text('ID: ${restdata.id}'),
              Text('Email: ${restdata.email}'),
              Text('Name: ${restdata.firstName} ${restdata.lastName}'),


            ],


          ),
        ),
      ),
    );
  }
}
