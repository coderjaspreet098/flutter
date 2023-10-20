import 'package:flutter/material.dart';
import 'package:untitled/cart.dart';
import 'package:untitled/comment.dart';
import 'package:untitled/getX.dart';
import 'package:untitled/get_request.dart';
import 'package:untitled/login_api.dart';
import 'package:untitled/product.dart';
import 'package:untitled/usermodel.dart';
import 'package:get/get.dart';
class Flutterapi extends StatefulWidget {
  const Flutterapi({super.key});
  @override
  State<Flutterapi> createState() => _FlutterapiState();
}
class _FlutterapiState extends State<Flutterapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1691442741007-fabc133403f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDE4NnxpVUlzblZ0akIwWXx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover,opacity: 50),),
        child: Center(
          child: Container(
            height: 500,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1691442741007-fabc133403f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDE4NnxpVUlzblZ0akIwWXx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
                    fit: BoxFit.cover)),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Productbutton()));
                      },
                      child: Text('Product')),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartapi()));
                  }, child: Text('Cart')),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Userapi()));
                  }, child: Text('User')),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Commentapi()));
                  }, child: Text('Comment')),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginapi()));
                  }, child: Text('Login api')),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SwagerUser()));
                  }, child: Text('Get Api')),
                  ElevatedButton(onPressed: (){
                    Get.to(()=>Getxmethod());
                  }, child:Text('GetXmethod'),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
