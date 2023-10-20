import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Loginapi extends StatefulWidget {
  const Loginapi({super.key});

  @override
  State<Loginapi> createState() => _LoginapiState();
}

class _LoginapiState extends State<Loginapi> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void click(String email ,password) async{
    try{
     var response = await post(
       Uri.parse('https://reqres.in/api/register'),
       body: {
         'email':email,
         'password':password,
       }
     );
     if(response.statusCode==200){
     print('Created Succesfully');
     //eve.holt@reqres.ine
     }else{
     print('Failed');

     }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up Page using Api'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                click(emailcontroller.text.toString(), passwordcontroller.text.toString());
              },
              child: Container(
                height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Signup',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))),
            )
          ],
        ),
      ) ,
    );
  }
}
