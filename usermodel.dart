import 'package:flutter/material.dart';
import 'package:untitled/user_model.dart';
import 'package:dio/dio.dart';
class Userapi extends StatefulWidget {
  const Userapi({super.key});

  @override
  State<Userapi> createState() => _UserapiState();
}

class _UserapiState extends State<Userapi> {
  UserModel?userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserModel'),
      ),
      body: Column(
        children: [
          if(userModel?.users!=null)
            Expanded(
              child: ListView.builder(
                itemCount: userModel!.users!.length,
                itemBuilder: (context, index) {
                  final user1 =userModel!.users![index];
                  return ListTile(
                    title: Column(
                      children: [
                        Text(user1.phone??'Phone'),
                        Text(user1.password??'Password'),
                      ],
                    ),
                  );
                },
              ),
            ),

        ],
      ),
    );
  }
  void initState(){
    super.initState();
    userproducts();
  }
  void userproducts()async{
    final dio =Dio();
    final response2 =await dio.get('https://dummyjson.com/users');
    setState(() {
      userModel= UserModel.fromJson(response2.data);
    });
  }
}


